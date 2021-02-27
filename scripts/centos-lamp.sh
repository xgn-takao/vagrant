#!/bin/bash

# Update CentOS with any patches
yum update -y --exclude=kernel

# Tools
yum install -y nano git unzip screen

# Apache
yum install -y httpd httpd-devel httpd-tools
chkconfig --add httpd
chkconfig httpd on
service httpd stop

rm -rf /var/www/html
ln -s /vagrant /var/www/html

service httpd start

# PHP
yum install -y php php-cli php-common php-devel php-mysql

# MySQL
yum install -y mysql mysql-server mysql-devel
chkconfig --add mysqld
chkconfig mysqld on

service mysqld start

mysql -u root -e "SHOW DATABASES";

# Download Starter Content
cd /vagrant
sudo -u vagrant wget -q https://raw.githubusercontent.com/xgn-takao/vagrant/master/files/index.html?token=AP2XBFEUTCHTS24JFICQ5PDAHHVC6
sudo -u vagrant wget -q https://raw.githubusercontent.com/xgn-takao/vagrant/master/files/info.php?token=AP2XBFDXDG2SMGKKR3QUPZDAHHVGW

service httpd restart