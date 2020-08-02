cd /var/www/vhosts/yan.bbtdevelopment.com/httpdocs/
sudo npm install
curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer
sudo composer install --ignore-platform-reqs