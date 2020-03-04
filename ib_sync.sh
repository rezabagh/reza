service postgresql stop
service IBSng stop
su - postgres << EOF
dropdb IBSng
createdb IBSng
createlang plpgsql IBSng
psql IBSng < IBSng.sql
exit
EOF
service postgresql start
service IBSng start
