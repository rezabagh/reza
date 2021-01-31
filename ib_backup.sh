rm -rf /var/lib/pgsql/IBSng.sql
su - postgres << EOF
pg_dump IBSng > IBSng.sql
exit
EOF
mv /var/lib/pgsql/IBSng.sql /var/www/html/
