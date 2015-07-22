#! /bin/bash

echo "Please type the website you wish to setup: (Please use ' example.com ' formatting)"
read website

cd /var/www

sudo mkdir ${website}

sudo mkdir -p ${website}/public_html
sudo mkdir -p ${website}/log
sudo mkdir -p ${website}/backups

sudo touch /etc/apache2/sites-available/${website}.conf

echo "

# public: /var/www/example.com/public_html/

<VirtualHost *:80>
  # Admin email, Server Name (domain name), and any aliases
  ServerAdmin webmaster@example.com
  ServerName  www.example.com
  ServerAlias example.com

  # Index file and Document Root (where the public files are located)
  DirectoryIndex index.html index.php
  DocumentRoot /var/www/example.com/public_html
  # Log file locations
  LogLevel warn
  ErrorLog  /var/www/example.com/log/error.log
  CustomLog /var/www/example.com/log/access.log combined
</VirtualHost>

" | sudo tee --append /etc/apache2/sites-available/${website}.conf

sudo sed -i s/example.com/${website}/g /etc/apache2/sites-available/${website}.conf

