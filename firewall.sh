yum -y install firewalld nano wget
systemctl unmask firewalld
systemctl enable firewalld
systemctl restart firewalld
systemctl status firewalld
firewall-cmd --list-all
cat >> /etc/sysctl.conf <<EOF
net.ipv4.ip_forward = 1
EOF
sysctl -p /etc/sysctl.conf
service network restart
firewall-cmd --zone=public --permanent --add-masquerade
firewall-cmd --zone=public --permanent --add-port=10-9999/udp
firewall-cmd --zone=public --permanent --add-port=10-9999/tcp
firewall-cmd --reload
firewall-cmd --list-all
rm -rf *.*
ll
ls
history -c
