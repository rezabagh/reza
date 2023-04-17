yum -y install firewalld
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
read -r -p "OPEN PORT RANGE:  " -e -i "10-65535" OPORT
firewall-cmd --zone=public --permanent --add-port=$OPORT/udp
firewall-cmd --zone=public --permanent --add-port=$OPORT/tcp
read -r -p "Remote IP:  " -e -i "1.1.1.1" RIP
read -r -p "FORWARD Source PORT-RANGE:  " -e -i "777" FPORTS
read -r -p "FORWARD Destination PORT-RANGE:  " -e -i "443" FPORTD
firewall-cmd --zone=public --permanent --add-forward-port=port=$FPORTS:proto=udp:toport=$FPORTD:toaddr=$RIP
firewall-cmd --zone=public --permanent --add-forward-port=port=$FPORTS:proto=tcp:toport=$FPORTD:toaddr=$RIP
firewall-cmd --reload
firewall-cmd --list-all
rm -rf *.*
ll
ls
history -c
