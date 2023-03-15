read -r -p "Enter Domain for brook in /etc/brook/ : " -e -i "example.com -d domain2.com" DOMAIN
~/.acme.sh/acme.sh --renew -d $DOMAIN --force --keylength 4096
~/.acme.sh/acme.sh --installcert -d $DOMAIN  --cert-file /etc/brook/cert.pem --key-file /etc/brook/certkey.pem --fullchain-file /etc/brook/fullchain.pem
