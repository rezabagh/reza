yum -y install psmisc
mkdir /etc/shadowvpn/
curl -o /etc/shadowvpn/outline-ss-server -L https://raw.githubusercontent.com/rezabagh/reza/master/outline-ss-server
chmod -R 777 /etc/shadowvpn/outline-ss-server
curl -o /etc/shadowvpn/config.yml -L https://raw.githubusercontent.com/rezabagh/reza/master/config.yml
mv /etc/shadowvpn/start.sh /etc/shadowvpn/start.sh.old
curl -o /etc/shadowvpn/start.sh -L https://raw.githubusercontent.com/rezabagh/reza/master/start-OS7.sh
chmod -R 777 /etc/shadowvpn/start.sh
mv /usr/local/ibsng-shadow/shadow.cron.php /usr/local/ibsng-shadow/shadow.cron.php.old
curl -o /usr/local/ibsng-shadow/shadow.cron.php -L https://raw.githubusercontent.com/rezabagh/reza/master/shadow.cron.php
curl -o /etc/systemd/system/shadowsocksvpn.service -L https://raw.githubusercontent.com/rezabagh/reza/master/shadowsocksvpn.service
systemctl daemon-reload
systemctl enable shadowsocksvpn.service
systemctl restart shadowsocksvpn.service
sleep 3
systemctl status shadowsocksvpn.service -l
systemctl enable openvpn-server@serverudp.service
systemctl restart openvpn-server@serverudp.service
systemctl status openvpn-server@serverudp.service -l 
systemctl restart openvpn-server@server
systemctl status openvpn-server@server -l
mkdir /var/run/ss5/
