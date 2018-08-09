sudo apt-get update
sudo apt-get install apache2

echo -e "Name of your Site\nEx: site.com"
read  WEB
sudo mkdir -p /var/www/$WEB/public_html

sudo chown -R $USER:$USER /var/www/$WEB/public_html

sudo chmod -R 755 /var/www

echo "<html>" > nano /var/www/$WEB/public_html/index.html
echo "  <head>" >> nano /var/www/$WEB/public_html/index.html
echo "    <title>Welcome to "$WEB"!</title>" >> nano /var/www/$WEB/public_html/index.html
echo "  </head>" >> nano /var/www/$WEB/public_html/index.html
echo "  <body>" >> nano /var/www/$WEB/public_html/index.html
echo "    <h1>Success!  The "$WEB" virtual host is working!</h1>" >> nano /var/www/$WEB/public_html/index.html
echo "  </body>" >> nano /var/www/$WEB/public_html/index.html
echo "</html>" >> nano /var/www/$WEB/public_html/index.html

sudo cp /etc/apache2/sites-available/000-default.conf /etc/apache2/sites-available/$WEB.conf

echo "<VirtualHost *:80>" > /etc/apache2/sites-available/$WEB.conf
echo "ServerName "$WEB >> /etc/apache2/sites-available/$WEB.conf
echo "ServerAlias www."$WEB >> /etc/apache2/sites-available/$WEB.conf
echo "    ServerAdmin webmaster@localhost" >> /etc/apache2/sites-available/$WEB.conf
echo "    DocumentRoot /var/www/"$WEB"/public_html" >> /etc/apache2/sites-available/$WEB.conf
echo "    ErrorLog ${APACHE_LOG_DIR}/error.log" >> /etc/apache2/sites-available/$WEB.conf
echo "    CustomLog ${APACHE_LOG_DIR}/access.log combined" >> /etc/apache2/sites-available/$WEB.conf
echo "</VirtualHost>" >> /etc/apache2/sites-available/$WEB.conf

sudo a2ensite $WEB.conf
#sudo a2ensite /etc/apache2/sites-available/$WEB.conf

sudo service apache2 restart

echo "127.0.0.1 "$WEB >> /etc/hosts
