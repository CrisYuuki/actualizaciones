#!/bin/bash

#Colores
rojo="\e[1;31m"
blanco="\e[0m"

#Actualización de paquetes
sudo apt update
sudo apt upgrade

#Instalación de paquetes
echo "$rojo Istalación de paquetes$blanco"
apt install net-tools
apt install nmap
apt install tree
echo -e "$rojo instalación de Wireshark$blanco"
apt install wireshark
echo -e "$rojo instalación de Metasploit Framework$blanco"
apt install ruby-rvm
cd /opt
sudo git clone https://github.com/rapid7/metasploit-framework.git
sudo chown -R $(whoami) /opt/metasploit-framework
cd metasploit-framework
cd metasploit-framework

rvm --default use ruby-${RUBYVERSION}@metasploit-framework

gem install bundler
bundle install
cd metasploit-framework
sudo bash -c 'for MSF in $(ls msf*); do ln -s /opt/metasploit-framework/$MSF /usr/local/bin/$MSF;done'
echo "export PATH=$PATH:/usr/lib/postgresql/10/bin" >> ~/.bashrc
. ~/.bashrc
sudo usermod -a -G postgres $(whoami)
sudo su - $(whoami)
cd /opt/metasploit-framework/
./msfdb init
