#!/bin/bash

# Update en upgrade het systeem
sudo apt update && sudo apt upgrade -y

# Installeer de benodigde afhankelijkheden
sudo apt install apache2 mysql-client mysql-server php libapache2-mod-php graphviz aspell ghostscript php-pspell php-cu>
# Configureer Apache2-webserver
sudo sed -i 's/;max_input_vars = 1000/max_input_vars = 5000/' /etc/php/8.1/apache2/php.ini
sudo sed -i 's/upload_max_filesize = 2M/upload_max_filesize = 20M/' /etc/php/8.1/apache2/php.ini
sudo sed -i 's/max_file_uploads = 20/max_file_uploads = 40/' /etc/php/8.1/apache2/php.ini
sudo service apache2 restart

# Installeer Moodle
wget https://download.moodle.org/download.php/direct/stable403/moodle-latest-403.tgz
sudo tar -zxvf moodle-latest-403.tgz --directory /var/www/html/

# Configureer MySQL
sudo service mysql start
sudo mysql -u root -p <<EOF
CREATE DATABASE moodle DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
CREATE USER 'groep4'@'localhost' IDENTIFIED BY 'Moodle_2023';
GRANT SELECT,INSERT,UPDATE,DELETE,CREATE,CREATE TEMPORARY TABLES,DROP,INDEX,ALTER ON moodle.* TO 'groep4'@'localhost';
EOF

# Wacht even om ervoor te zorgen dat MySQL volledig is opgestart
sleep 5

# Configureer webserverrechten
sudo chown -R www-data /var/www
sudo chmod -R 755 /var/www
sudo mkdir /var/moodledata
sudo chown -R www-data /var/moodledata
sudo chmod -R 777 /var/moodledata
sudo chmod -R 0755 /var/www/html/moodle
sudo service apache2 restart

echo "Elo Moodle is succesvol geïnstalleerd!"
