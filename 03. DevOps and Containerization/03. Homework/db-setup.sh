echo "* Add hosts ..."
echo "192.168.89.100 web.do1.lab web" >> /etc/hosts
echo "192.168.89.101 db.do1.lab db" >> /etc/hosts

echo "* Install Software ..."
dnf install -y mariadb mariadb-server git

echo "* Start MariaDB ..."
systemctl enable mariadb
systemctl start mariadb

echo "* Open port 3306/TCP in the firewall ..."
firewall-cmd --add-service=mysql --permanent && firewall-cmd --reload

echo "* Cloning the web app ..."
cd /home/vagrant
git clone https://github.com/shekeriev/bgapp

echo "* Creating and loading the database ..."
mysql -u root < /home/vagrant/bgapp/db/db_setup.sql