#!/bin/bash

# @TODO: Variable-ize this up.
#WEBROOT="/Users/webchick/Sites"
#RELEASE="8.0-alpha4"
#PROD="prod"
#DEV="dev"

# Move to the web root.
cd ~/Sites

# Set up a 'bare' working repo.
rm -rf d8demo.git
mkdir d8demo.git
git init --bare --shared d8demo.git
chgrp -R staff d8demo.git

# Make a 'prod' site.
sudo rm -rf prod
git clone file:///Users/webchick/Sites/d8demo.git prod
wget http://ftp.drupal.org/files/projects/drupal-8.0-alpha4.tar.gz
tar -zxvf drupal-8.0-alpha4.tar.gz -C ./prod --strip-components=1
cd prod
git add .
git commit -m "Initial commit: Add all the D8 code files."
git push origin master
 
# @TODO: Patches?

# Install Drupal 8: prod.
mysql -e "DROP DATABASE IF EXISTS prod; CREATE DATABASE prod;"
drush si --db-url=mysql://root:@127.0.0.1:33066/prod --account-pass=admin -y

# Hard-code site name as "Production" to differentiate between sites. 
echo "
\$conf['system.site']['name'] = 'Production';" | sudo tee -a sites/default/settings.php

# Clear zee cache.
drush cc all

# Add the new files to Git.
git add sites/default/files/config_*
git add sites/default/files/php/service_container/.htaccess 
git add sites/default/files/php/twig/.htaccess 
git commit -m "Add CMI and compiled PHP files after initial installation."
git push

# Now, make the dev site, based on prod.
cd ~/Sites
sudo rm -rf dev
git clone file:///Users/webchick/Sites/d8demo.git dev
cd dev

# Copy over the database.
mysql -e "DROP DATABASE IF EXISTS dev; CREATE DATABASE dev;"
mysqldump prod | mysql dev

# Set the database/config directories for dev.
cp ../prod/sites/default/settings.php sites/default
echo "
\$databases['default']['default']['database'] = 'dev';
\$config_directories['active']['path'] .= '_dev';
\$config_directories['staging']['path'] .= '_dev';
\$conf['system.site']['name'] = 'Dev';
" | sudo tee -a sites/default/settings.php

# Copy over the prod config files to dev's directories.
export CONFIG_DIR=`find sites/default/files -type d -name "config*"`
mkdir `echo $CONFIG_DIR`/active_dev
mkdir `echo $CONFIG_DIR`/staging_dev
cp -r `echo $CONFIG_DIR`/active/* `echo $CONFIG_DIR`/active_dev/
 
# Clear zee cache.
drush cc all

