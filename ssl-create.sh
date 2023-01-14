systemctl stop httpd
mkdir /etc/ssl/
read -r -p "Enter Domain: or Domains: " -e -i "www.example.com or www.example.com -d www.domain2.com -d domain3.com" DOMAIN
~/.acme.sh/acme.sh --issue -d $DOMAIN --standalone
~/.acme.sh/acme.sh --installcert -d $DOMAIN  --cert-file /etc/ssl/cert.pem --key-file /etc/ssl/certkey.pem --fullchain-file /etc/ssl/fullchain.pem
systemctl restart httpd
systemctl status  httpd -l
