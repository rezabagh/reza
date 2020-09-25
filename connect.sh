yum -y install httpd
systemctl mask firewalld
systemctl stop firewalld
firewall-cmd --list-all
curl -o /var/www/html/index.html -L https://raw.githubusercontent.com/rezabagh/reza/master/index.html
systemctl enable httpd
systemctl restart httpd
systemctl status httpd -l
systemctl status mtproto-proxy -l
read -r -p "Server Address:  " -e -i "xxx.xxx.xxx.xxx" ADDRESS
read -r -p "Secret:  " -e -i "ee9cf0176721eddc8bb50878cfc1e4b707676f6f676c652e636f6d" SECRET
sed -i "s/OLDADDRESS/$ADDRESS/g" /var/www/html/index.html
sed -i "s/OLDSECRET/$SECRET/g" /var/www/html/index.html
