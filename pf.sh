systemctl unmask firewalld
systemctl enable firewalld
systemctl restart firewalld
systemctl status firewalld
firewall-cmd --list-all
firewall-cmd --zone=public --permanent --add-port=10-9999/udp
firewall-cmd --zone=public --permanent --add-port=10-9999/tcp
firewall-cmd --reload
firewall-cmd --list-all
systemctl stop firewalld
systemctl mask firewalld
firewall-cmd --list-all
mkdir /etc/pf
curl -o /etc/pf/pf-linux-amd64 -L  https://github.com/rezabagh/reza/blob/master/pf-linux-amd64
curl -o /etc/systemd/system/pf.service -L https://raw.githubusercontent.com/rezabagh/reza/master/pf.service
curl -o /etc/pf/add.sh -L https://raw.githubusercontent.com/rezabagh/reza/master/add.sh
curl -o /etc/pf/add.json -L https://raw.githubusercontent.com/rezabagh/reza/master/add.json
curl -o /etc/pf/rules.json -L https://raw.githubusercontent.com/rezabagh/reza/master/rules.json
chmod 777 -R /etc/pf
systemctl daemon-reload
systemctl enable pf.service
sleep 3
bash /etc/pf/add.sh 
systemctl restart pf.service
systemctl status pf.service -l
sleep 3
journalctl -u pf.service --since today -f
chmod 777 -R /etc/pf
