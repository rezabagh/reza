SECRET=$(openssl rand -hex 16)
echo "This is your new Random SECRET"
echo "$SECRET"
sleep 30
curl -o /opt/mtprotoproxy/config.py -L https://raw.githubusercontent.com/rezabagh/reza/master/config-py
sed -i "s/OLDSECRET/$SECRET/g" /opt/mtprotoproxy/config.py
systemctl restart mtprotoproxy
sleep 30
echo "Please USE this NEW MTPROTO LINK"
systemctl status mtprotoproxy -l
rm -rf *.*
