read -r -p "TAG AD:  " -e -i "b8ff9a4e5117a3a044d1633d042e43f9" TAGAD
read -r -p "TLS DOMAIN:  " -e -i "www.cloudflare.com" TLS
sed -i "s/b8ff9a4e5117a3a044d1633d042e43f9/$TAGAD/g" /opt/mtprotoproxy/config.py
sed -i "s/www.cloudflare.com/$TLS/g" /opt/mtprotoproxy/config.py
systemctl restart mtprotoproxy
systemctl status mtprotoproxy -l
yum -y install httpd
systemctl mask firewalld
systemctl stop firewalld
firewall-cmd --list-all
curl -o /var/www/html/index.html -L https://raw.githubusercontent.com/rezabagh/reza/master/index.html
systemctl enable httpd
systemctl restart httpd
systemctl status httpd -l
systemctl status mtprotoproxy -l
read -r -p "Server Address:  " -e -i "xxx.xxx.xxx.xxx" ADDRESS
read -r -p "Secret:  " -e -i "ee9cf0176721eddc8bb50878cfc1e4b7077777772e636c6f7564666c6172652e636f6d" SECRET
sed -i "s/OLDADDRESS/$ADDRESS/g" /var/www/html/index.html
sed -i "s/OLDSECRET/$SECRET/g" /var/www/html/index.html
systemctl status mtprotoproxy -l
rm -rf *.*
