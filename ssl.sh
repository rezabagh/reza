read -r -p "Enter Domain: " -e -i "www.example.com" DOMAIN
certbot certonly --manual --preferred-challenges=http --manual-public-ip-logging-ok -d $DOMAIN

