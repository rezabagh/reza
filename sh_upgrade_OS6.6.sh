mkdir /etc/shadowvpn/
curl -o /etc/shadowvpn/outline-ss-server -L https://raw.githubusercontent.com/rezabagh/reza/master/outline-ss-server
chmod -R 777 /etc/shadowvpn/outline-ss-server
curl -o /etc/shadowvpn/config.yml -L https://raw.githubusercontent.com/rezabagh/reza/master/config.yml
mv /etc/shadowvpn/start.sh /etc/shadowvpn/start.sh.old
curl -o /etc/shadowvpn/start.sh -L https://raw.githubusercontent.com/rezabagh/reza/master/start.sh
chmod -R 777 /etc/shadowvpn/start.sh
mv /usr/local/ibsng-shadow/shadow.cron.php /usr/local/ibsng-shadow/shadow.cron.php.old
curl -o /usr/local/ibsng-shadow/shadow.cron.php -L https://raw.githubusercontent.com/rezabagh/reza/master/shadow.cron.php
curl -o /etc/rc.d/init.d/shadowvpn -L https://raw.githubusercontent.com/rezabagh/reza/master/shadowvpn
chmod -R 755 /etc/rc.d/init.d/shadowvpn
chkconfig --add shadowvpn
sleep 3
bash /etc/shadowvpn/start.sh
sleep 3
cat /root/nohup.out
cd /root/
rm -rf *.*
ls
curl -o account_update.sh -L https://git.io/JLnRW && chmod 777   account_update.sh && bash  account_update.sh
