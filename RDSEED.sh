SECRET=$(openssl rand -hex 16)
echo ""
echo "This is your new Random SECRET"
echo "$SECRET"
echo ""
sleep 3
curl -o /opt/mtprotoproxy/config.py -L https://raw.githubusercontent.com/rezabagh/reza/master/config-py
sed -i "s/OLDSECRET/$SECRET/g" /opt/mtprotoproxy/config.py
systemctl restart mtprotoproxy
sleep 5
echo ""
echo "Please USE this NEW MTPROTO LINK"
systemctl status mtprotoproxy -l
echo ""
rm -rf *.*
