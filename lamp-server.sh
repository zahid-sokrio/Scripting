#!/bin/bash

# Update system packages
sudo apt update

# Install Apache web server
sudo apt install apache2 -y

# Enable Apache to start on boot
sudo systemctl enable apache2

# Install MySQL Server
sudo apt install mysql-server -y

# Install PHP and required modules
sudo apt install php libapache2-mod-php php-mysql -y

# Restart Apache
sudo systemctl restart apache2

# Display PHP version
php --version

# Display MySQL version
mysql --version

echo "LAMP Server Is Live Now"
