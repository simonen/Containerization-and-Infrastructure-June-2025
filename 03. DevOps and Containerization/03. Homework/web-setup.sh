echo "* Add hosts ..."
echo "192.168.89.100 web.do1.lab web" >> /etc/hosts
echo "192.168.89.101 db.do1.lab db" >> /etc/hosts

echo "* Install Software ..."
dnf install -y httpd php php-mysqlnd git

echo "* Start HTTP ..."
systemctl enable --now httpd

echo "* Adding HTTP service to firewall ..."
firewall-cmd --add-service=http --permanent
firewall-cmd --reload

echo "* Cloning the web app ..."
cd /home/vagrant
git clone https://github.com/shekeriev/bgapp

echo "* Copying web site files to /var/www/html/ ..."
cp bgapp/web/* /var/www/html

echo "* Allow HTTPD to make network connections ..."
setsebool -P httpd_can_network_connect=1