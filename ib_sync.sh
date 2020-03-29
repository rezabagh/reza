service IBSng stop
cd /var/lib/pgsql
read -r -p "Put The Remote server IP ADDRESS:" -e -i "178.33.14.218" IPADDRESS
wget -N http://$IPADDRESS/IBSng.sql
su - postgres << EOF
dropdb IBSng
createdb IBSng
createlang plpgsql IBSng
psql IBSng < IBSng.sql
exit
EOF
service IBSng start
