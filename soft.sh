yum -y groupinstall "Development Tools"
wget https://www.softether-download.com/files/softether/v4.34-9745-rtm-2020.04.05-tree/Linux/SoftEther_VPN_Server/64bit_-_Intel_x64_or_AMD64/softether-vpnserver-v4.34-9745-rtm-2020.04.05-linux-x64-64bit.tar.gz
tar -xvzf softether-vpnserver-v4.34-9745-rtm-2020.04.05-linux-x64-64bit.tar.gz
cd vpnserver
make
cd ..
mv vpnserver /usr/local
cd /usr/local/vpnserver/
chmod 600 *
chmod 700 vpnserver
chmod 700 vpncmd
curl -o /etc/init.d/vpnserver -L https://raw.githubusercontent.com/rezabagh/reza/master/vpnserver
chmod 755 /etc/init.d/vpnserver
systemctl daemon-reload
mkdir /var/lock/subsys
chkconfig --add vpnserver
/sbin/chkconfig vpnserver on
/etc/init.d/vpnserver start
systemctl enable vpnserver
systemctl restart vpnserver
systemctl status vpnserver -l
