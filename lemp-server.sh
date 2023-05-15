#!/bin/bash

# Update system packages
sudo apt update

# Install Nginx web server
sudo apt install nginx -y

# Enable Nginx to start on boot
sudo systemctl enable nginx

# Install MySQL Server
sudo apt install mysql-server -y






### Configuring MySQL
# sudo systemctl start mysql.service
# sudo mysql
### ALTER USER 'root'@'localhost' IDENTIFIED WITH mysql_native_password BY 'password';
####################################################################################### GRANT ALL PRIVILEGES ON *.* TO 'root'@'%';
# ALTER USER 'root'@'localhost' IDENTIFIED WITH mysql_native_password BY 'password';
# FLUSH PRIVILEGES;
# exit
# mysql -u root -p
# sudo mysql_secure_installation
