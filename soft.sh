yum -y groupinstall "Development Tools"
wget https://github.com/SoftEtherVPN/SoftEtherVPN_Stable/releases/download/v4.38-9760-rtm/softether-vpnserver-v4.38-9760-rtm-2021.08.17-linux-x64-64bit.tar.gz
tar -xvzf softether-vpnserver-v4.38-9760-rtm-2021.08.17-linux-x64-64bit.tar.gz
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
cd /root/
rm -rf *.*
ll
ls
