#!/bin/bash
mkdir /var/www/vhosts/yan.bbtdevelopment.com/httpdocs/
sudo apt-get update
sudo apt-get install nodejs -y
sudo apt-get install npm  -y
sudo npm install forever -g
