service IBSng stop
cd /var/lib/pgsql
su - postgres << EOF
dropdb IBSng
createdb IBSng
createlang plpgsql IBSng
psql IBSng < IBSng.sql
exit
EOF
service IBSng start
