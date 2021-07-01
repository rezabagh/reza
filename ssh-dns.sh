read -r -p "Enter Domain: or Domains: " -e -i "*.your-domain -d your-domain" DOMAIN
certbot certonly --manual --manual-auth-hook /etc/letsencrypt/acme-dns-auth.py --preferred-challenges dns --manual-public-ip-logging-ok --debug-challenges -d $DOMAIN
