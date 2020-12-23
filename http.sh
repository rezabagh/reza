cd /etc/
rm -rf apache2bk
mv apache2 apache2bk
cd /usr/local
rm -rf apachebk
mv apache apachebk
yum reinstall ea-apache24* -y
