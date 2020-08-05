#!/bin/bash
cd /var/www/vhosts/yan.bbtdevelopment.com/httpdocs
#export COMPOSER_HOME="$HOME/.config/composer";
#composer
#composer install --ignore-platform-reqs
/opt/plesk/php/7.2/bin/php /usr/lib/plesk-9.0/composer.phar install
