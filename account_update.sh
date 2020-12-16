read -r -p "Root Pass:  " -e -i "vpsgroups" RPASS
sed -i "s/vpsgroups/$RPASS/g" /usr/local/ibsng-IKEv2/config.php
sed -i "s/vpsgroups/$RPASS/g" /usr/local/ibsng-IPsec-VPN/config.php
sed -i "s/vpsgroups/$RPASS/g" /usr/local/ibsng-shadow/config.php
cat /usr/local/ibsng-IKEv2/config.php
cat /usr/local/ibsng-IPsec-VPN/config.php
cat /usr/local/ibsng-shadow/config.php
