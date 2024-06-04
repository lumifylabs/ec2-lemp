#!/bin/bash

################################################################
########### These commands will be run automatically ###########
################################################################

###### Update all packages in package manager ######
sudo apt update

###### Install nginx web server ######
sudo apt install nginx -y

###### Check the state of the web server ######
sudo systemctl status nginx

###### Install MySQL ######
sudo apt install mysql-server -y

###### Install php-fpm and php-mysql ######
sudo apt install php-fpm php-mysql -y

###### Install other common php extensions ######
sudo apt install openssl php-bcmath php-curl php-json php-mbstring php-mysql php-tokenizer php-gd php-xml php-zip -y

###### Check php version ######
php -v

###### Disable default Nginx host ######
sudo unlink /etc/nginx/sites-enabled/default

###### Reload nginx to apply changes ######
sudo systemctl reload nginx

###### Install Lets Encrypt Cert Bot ######
sudo snap install --classic certbot

###### Prepare the Certbot command ######
sudo ln -s /snap/bin/certbot /usr/bin/certbot

###### Generate Diffie-Hellman keys ######
sudo openssl dhparam -out /etc/nginx/dhparam.pem 2048

###### Create a common ACME-challenge directory ###### 
sudo mkdir -p /var/www/_letsencrypt
sudo chown www-data /var/www/_letsencrypt

################################################################
###### Once installed several steps must be run manually! ######
################################################################

###### Get HTTPS certificates ######

# $ sudo certbot --nginx

###### Manual MySQL setup ######

# $ sudo mysql

###### Set a password for the root user ######

# > ALTER USER 'root'@'localhost' IDENTIFIED WITH mysql_native_password BY 'PassWord.1';

# Exit MySQL Shell
# > exit

# Start the interactive script by running:
# $ sudo mysql_secure_installation
