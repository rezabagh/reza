rm -rf /opt/mtp_proxy/releases/0.1.0/vm.args
curl -o /opt/mtp_proxy/releases/0.1.0/vm.args -L https://raw.githubusercontent.com/rezabagh/reza/master/vm.args
curl -o /root/live.sh -L https://raw.githubusercontent.com/rezabagh/reza/master/live.sh
systemctl restart mtproto-proxy
systemctl status mtproto-proxy -l
bash /root/live.sh
