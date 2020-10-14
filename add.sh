systemctl stop pf.service
cp /etc/pf/add.json /etc/pf/rules.json
systemctl restart pf.service
systemctl status pf.service -l
