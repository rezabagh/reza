mkdir /etc/ssl/
read -r -p "Enter Domain: or Domains: " -e -i "www.example.com or www.example.com -d www.domain2.com -d domain3.com" DOMAIN
~/.acme.sh/acme.sh --issue --dns -d $DOMAIN --standalone --keylength 4096
read -r -p "Please add the TXT record to your DNS records " -e -i “Are you ready?“ YYY
~/.acme.sh/acme.sh --renew -d $DOMAIN --force --keylength 4096
~/.acme.sh/acme.sh --installcert -d $DOMAIN  --cert-file /etc/ssl/cert.pem --key-file /etc/ssl/certkey.pem --fullchain-file /etc/ssl/fullchain.pem
