#!/bin/bash

# Update en upgrade het systeem
sudo apt update && sudo apt upgrade -y

# Installeer benodigde pakketten
sudo apt-get install -y build-essential curl g++ gettext shared-mime-info libssl-dev

# Download en voer het Citadel-installatiescript uit
wget -q -O - http://easyinstall.citadel.org/install | sh

#Please enter the name of the Citadel user account that should be granted administrative privileges once created: groep4
#Enter a password for the system administrator: groep4
#Please specify User ID: citadel
#Please specify the IP address which the server should be listening to: *
#Specify the TCP port number on which your server will run: 504
#Please choose the user authentication mode: 2 (External LDAP – RFC 2307 compliant directory)
#Host name or IP of LDAP Server: 192.168.139.12
#The "Base DN" for authentication: dc=uni-deventer,dc=local
#The "Bind DN": cn=admin,dc=uni-deventer,dc=local
#The password for your Bind DN: uni-admin
#Select on which port do you want WebCit to listen for HTTP requests: 80
#Select On which port do you want WebCit to listen for HTTPS requests: 443
