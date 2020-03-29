service IBSng stop
cd /var/lib/pgsql
read -r -p "Put The Remote server IP ADDRESS: Ex. 178.33.14.218" -e -i "xxx.xxx.xxx.xxx" IPADDRESS
wget -N http://$IPADDRESS/IBSng.sql
su - postgres << EOF
dropdb IBSng
createdb IBSng
createlang plpgsql IBSng
psql IBSng < IBSng.sql
exit
EOF
service IBSng start
