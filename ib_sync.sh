service IBSng stop
cd /var/lib/pgsql
rm -rf /var/lib/pgsql/IBSng.sql
read -r -p "Put The remote server IP Address of IBSng.sql; Ex. 178.33.14.218:  " -e -i "xxx.xxx.xxx.xxx" IPADDRESS
wget -N http://$IPADDRESS/IBSng.sql
su - postgres << EOF
dropdb IBSng
createdb IBSng
createlang plpgsql IBSng
psql IBSng < IBSng.sql
exit
EOF
service IBSng start
