<?php

set_time_limit(30);
ini_set('max_execution_time', 30);

require_once ('config.php');
require_once ('Timer.php');

$timer = new Timer();
$timer->start();

print "IBSng-Shadowsocks cron job starts: \n";

$dbconn3 = pg_connect("dbname=IBSng user=ibs password=ibs");

// get all the users
$users_all = array();
$nu = pg_query($dbconn3, "SELECT * FROM normal_users order by user_id");

while ($nu_row = pg_fetch_array($nu, NULL, PGSQL_ASSOC)) {
    $users_all[$nu_row['user_id']]['username'] = $nu_row['normal_username'];
    $users_all[$nu_row['user_id']]['password'] = $nu_row['normal_password'];

    $g = pg_query($dbconn3, "SELECT group_id FROM users WHERE user_id='" . $nu_row['user_id'] . "'");

    while ($g_row = pg_fetch_array($g, NULL, PGSQL_ASSOC)) {
        $users_all[$nu_row['user_id']]['group_id'] = $g_row['group_id'];
    }

    $ua = pg_query($dbconn3, "SELECT * FROM user_attrs WHERE user_id='" . $nu_row['user_id'] . "'");

    while ($ua_row = pg_fetch_array($ua, NULL, PGSQL_ASSOC)) {
        $users_all[$nu_row['user_id']][$ua_row['attr_name']] = $ua_row['attr_value'];
    }
}

// get all the groups
$groups_all = array();
$g = pg_query($dbconn3, "SELECT * FROM groups order by group_id");

while ($g_row = pg_fetch_array($g, NULL, PGSQL_ASSOC)) {
    $ga = pg_query($dbconn3, "SELECT * FROM group_attrs WHERE group_id='" . $g_row['group_id'] . "'");

    $groups_all[$g_row['group_id']]['group_name'] = $g_row['group_name'];

    while ($ga_row = pg_fetch_array($ga, NULL, PGSQL_ASSOC)) {
        $groups_all[$g_row['group_id']][$ga_row['attr_name']] = $ga_row['attr_value'];
    }
}

// get the effective users
$users_eff = array();

foreach ($users_all as $key => $value) {
    if ((isset($value['first_login'])) AND (isset($value['rel_exp_date']))) {
        if (($value['first_login'] + $value['rel_exp_date']) < time()) {
            continue;
        }
    }

    if (isset($value['abs_exp_date'])) {
        if ($value['abs_exp_date'] < time()) {
            continue;
        }
    }

    if ((isset($value['first_login'])) AND (isset($groups_all[$value['group_id']]['rel_exp_date']))) {
        if (($value['first_login'] + $groups_all[$value['group_id']]['rel_exp_date']) < time()) {
            continue;
        }
    }

    $users_eff[] = $value;
}

$users_eff_bak = $users_eff;

foreach ($servers as $key => $value) {

    $server = $servers[$key];

    $users_eff = $users_eff_bak;

    $gids = array();

    foreach ($server['groups'] as $g_shadow) {
        foreach ($groups_all as $g_key => $g_all) {
            if ($g_all['group_name'] == $g_shadow) {
                $gids[] = $g_key;
                break;
            }
        }
    }

    foreach ($users_eff as $key => $value) {
        if (!in_array($value['group_id'], $gids)) {
            unset($users_eff[$key]);
        }
    }

    // generate the config-new.yml file
    $str_cfg = "keys:" . "\n";
    //$str_cfg = $str_cfg . '"port_password": {' . "\n";


    if ($has_multi_server) {
        // the username should be unique in the IBSng, in this case,
        // a normal username should be: id-port (9-9999)
        foreach ($users_eff as $key => $value) {
            $port = substr(strrchr($value['username'], "-"), 1);
            $str_cfg = $str_cfg . '"' . $port . '":"' . $value['password'] . '",' . "\n";
        }
    } else {
        foreach ($users_eff as $key => $value) {
            $str_cfg = $str_cfg . '- id: ' . $value['username'] . "\n";
            $str_cfg = $str_cfg . '  port: ' . $value['username'] . "\n";
		    $str_cfg = $str_cfg . '  cipher: chacha20-ietf-poly1305' . "\n";
             $str_cfg = $str_cfg . '  secret: ' . $value['password'] . "\n";
             $str_cfg = $str_cfg . ' ' . "\n";
        }
    }

    $len = strlen($str_cfg);
    $str_cfg = substr($str_cfg, 0, $len - 2);

   // $str_cfg = $str_cfg . "\n";
   // $str_cfg = $str_cfg . '},' . "\n";
   // $str_cfg = $str_cfg . '"timeout": 300,' . "\n";
   // $str_cfg = $str_cfg . '"method": "aes-256-cfb"' . "\n";
   // $str_cfg = $str_cfg . '}' . "\n";

    $filename_new = $path_local . $server['ip'] . "-" . "config-new.yml";
    $filename = $path_local . $server['ip'] . "-" . "config.yml";
    $filename_remote = $path_remote . "config.yml";

    $fh = fopen($filename_new, "w");
    echo fwrite(
            $fh, $str_cfg);
    fclose($fh);

    // flag for restart the shadow server
    $flag_restart = 0;

    // compare config-new.yml with config.yml
    if (file_exists($filename)) {
        $str_cfg_new = file_get_contents($filename_new);
        $str_cfg = file_get_contents($filename);

        $comp = strcmp($str_cfg_new, $str_cfg);

        if ($comp == 0) {
            print $filename_new . " is the same with " . $filename . "! \n";
        } else {
            unlink($filename);
            rename($filename_new, $filename);

            $flag_restart = 1;

            print $filename . " has been updated!" . "\n";
        }
    } else {
        $flag_restart = 1;

        rename($filename_new, $filename);
        print $filename . " does not exist, generating now!" . "\n";
    }

    // copy to the remote server
    if ($flag_restart == 1) {
        $con = ssh2_connect($server['ip'], 22);
        ssh2_auth_password($con, $server['username'], $server['password']);

        ssh2_scp_send($con, $filename, $filename_remote, 0644);

        $stream = ssh2_exec($con, "source " . $script_remote);

        stream_set_blocking($stream, true);

        $output = stream_get_contents($stream);

        echo $output;
    }
}

$timer->stop();
print "Execution time: " . $timer->spent() . "\n";
print "IBSng-Shadowsocks cron job ends! \n";




