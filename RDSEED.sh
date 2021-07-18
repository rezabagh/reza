SECRET=$(openssl rand -hex 16)
echo "$SECRET"
curl -o /opt/mtprotoproxy/config.py -L https://raw.githubusercontent.com/rezabagh/reza/master/config-py
sed -i "s/OLDSECRET/$SECRET/g" /opt/mtprotoproxy/config.py
systemctl restart mtprotoproxy
systemctl status mtprotoproxy -l
