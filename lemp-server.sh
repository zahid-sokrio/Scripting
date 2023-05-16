#!/bin/bash

# Update system packages
sudo apt update

sleep 2

# Install Nginx web server
sudo apt install nginx -y

sleep 2

# Enable Nginx to start on boot
sudo systemctl enable nginx

sleep 2

# Install MySQL Server
sudo apt install mysql-server -y

sleep 2

# Install PHP and required modules
sudo apt install php-fpm php-mysql php-mbstring -y

sleep 2

# Configure PHP for Nginx
sudo sed -i 's/^;cgi.fix_pathinfo=1/cgi.fix_pathinfo=0/' /etc/php/7.*/fpm/php.ini

sleep 2

# Restart PHP-FPM service
sudo systemctl restart php7.*-fpm

sleep 2

# Restart Nginx
sudo systemctl restart nginx

sleep 3

# Display PHP version
php --version

# Display MySQL version
mysql --version

echo "LEMP Server Ready"


### Configuring MySQL
# sudo systemctl start mysql.service
# sudo mysql
# ALTER USER 'root'@'localhost' IDENTIFIED WITH mysql_native_password BY 'password';
######### GRANT ALL PRIVILEGES ON *.* TO 'root'@'%';
# FLUSH PRIVILEGES;
# exit
# mysql -u root -p
# sudo mysql_secure_installation
