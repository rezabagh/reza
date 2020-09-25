rm -rf /opt/mtp_proxy/releases/0.1.0/vm.args
curl -o /opt/mtp_proxy/releases/0.1.0/vm.args -L https://raw.githubusercontent.com/rezabagh/reza/master/vm.args
curl -o /root/live.sh -L https://raw.githubusercontent.com/rezabagh/reza/master/live.sh
read -r -p "TAG AD:  " -e -i "8b081275ec12abd306faeb2f13efbdcb" TAGAD
sed -i "s/8b081275ec12abd306faeb2f13efbdcb/$TAGAD/g" /opt/mtp_proxy/releases/0.1.0/sys.config
systemctl restart mtproto-proxy
systemctl status mtproto-proxy -l
bash /root/live.sh
