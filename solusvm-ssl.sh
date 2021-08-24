/root/.acme.sh/acme.sh --issue -d kvm.vpsgroups.uk -w /usr/local/solusvm/www/.verification
/root/.acme.sh/acme.sh --installcert -d kvm.vpsgroups.uk \
--key-file /usr/local/svmstack/nginx/ssl/ssl.key \
--fullchain-file /usr/local/svmstack/nginx/ssl/ssl.crt
cd /usr/local/svmstack/nginx/ssl && cat ssl.key ssl.crt > ssl.pem
service svmstack-nginx restart
sh /usr/local/svmstack/sshwebsocket/quit
sh /usr/local/svmstack/sshwebsocket/port_check
cat /usr/local/svmstack/nginx/ssl/ssl.crt /usr/local/svmstack/nginx/ssl/ssl.key > /usr/local/solusvm/includes/nvnc/cert.pem
