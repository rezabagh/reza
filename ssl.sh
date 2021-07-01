read -r -p "Enter Domain: or Domains: " -e -i "www.example.com or www.example.com -d www.domain2.com -d domain3.com" DOMAIN
certbot certonly --manual --preferred-challenges=http --manual-public-ip-logging-ok --debug-challenges -d $DOMAIN
