mkdir /etc/ssl/
read -r -p "Enter Email: " -e -i "vm@vpsi.store" EMAIL
yum -y install socat
apt-get install socat
curl https://get.acme.sh | sh
~/.acme.sh/acme.sh --set-default-ca --server letsencrypt
~/.acme.sh/acme.sh --register-account -m $EMAIL
