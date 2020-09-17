systemctl stop shadowsocks.service 
systemctl stop streambrook.service
systemctl mask shadowsocks.service 
systemctl mask streambrook.service
rm -rf /etc/systemd/system/shadowsocks.service
rm -rf /etc/systemd/system/streambrook.service
rm -rf /etc/systemd/system/brook.service
rm -rf /etc/systemd/system/socks5.service
rm -rf /etc/brook/brook
curl -L https://github.com/txthinking/brook/releases/download/v20200909/brook_linux_amd64 -o /etc/brook/brook
chmod +x /etc/brook/brook
curl -o /etc/systemd/system/wsserver.service -L https://raw.githubusercontent.com/rezabagh/reza/master/wsserver.service
curl -o /etc/systemd/system/brook.service -L https://raw.githubusercontent.com/rezabagh/reza/master/brook.service
curl -o /etc/systemd/system/socks5.service -L https://raw.githubusercontent.com/rezabagh/reza/master/socks5.service
systemctl daemon-reload
systemctl enable wsserver.service
systemctl restart wsserver.service
systemctl restart brook.service
systemctl restart socks5.service
sleep 3
systemctl status wsserver.service -l
systemctl status brook.service -l
systemctl status socks5.service -l
