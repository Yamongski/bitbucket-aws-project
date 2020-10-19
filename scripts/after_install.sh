#!/bin/bash

# Copy source files to DEVELOPMENT environment
if [ "$DEPLOYMENT_GROUP_NAME" == "staging-deployment-group" ]; then
chown -R abryan:psacln /var/www/vhosts/yan.bbtdevelopment.com/code-deploy-temp
find /var/www/vhosts/yan.bbtdevelopment.com/code-deploy-temp -type f -not -name ".pl" -not -name ".cgi" -not -name "*.sh" -print0 | xargs -0 chmod 0644
find /var/www/vhosts/yan.bbtdevelopment.com/code-deploy-temp -type d -print0 | xargs -0 chmod 0755
shopt -s dotglob
rsync -avz /var/www/vhosts/yan.bbtdevelopment.com/code-deploy-temp/* /var/www/vhosts/yan.bbtdevelopment.com/staging.yan.bbtdevelopment.com/
rm -rf /var/www/vhosts/yan.bbtdevelopment.com/code-deploy-temp/*
export COMPOSER_HOME="$HOME/.config/composer";
cd /var/www/vhosts/yan.bbtdevelopment.com/staging.yan.bbtdevelopment.com/
/opt/plesk/php/7.2/bin/php /usr/lib/plesk-9.0/composer.phar install --no-interaction --no-dev --optimize-autoloader
fi

# Copy source files to PRODUCTION environment
if [ "$DEPLOYMENT_GROUP_NAME" == "production-deployment-group" ]; then
chown -R abryan:psacln /var/www/vhosts/yan.bbtdevelopment.com/code-deploy-temp
find /var/www/vhosts/yan.bbtdevelopment.com/code-deploy-temp -type f -not -name ".pl" -not -name ".cgi" -not -name "*.sh" -print0 | xargs -0 chmod 0644
find /var/www/vhosts/yan.bbtdevelopment.com/code-deploy-temp -type d -print0 | xargs -0 chmod 0755
shopt -s dotglob
rsync -avz /var/www/vhosts/yan.bbtdevelopment.com/code-deploy-temp/* /var/www/vhosts/yan.bbtdevelopment.com/httpdocs
rm -rf /var/www/vhosts/yan.bbtdevelopment.com/code-deploy-temp/*
export COMPOSER_HOME="$HOME/.config/composer";
cd /var/www/vhosts/yan.bbtdevelopment.com/httpdocs/
/opt/plesk/php/7.2/bin/php /usr/lib/plesk-9.0/composer.phar install --no-interaction --no-dev --optimize-autoloader
fi
