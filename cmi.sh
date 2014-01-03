#!/bin/bash

# @TODO: Variable-ize this up.
#WEBROOT="/Users/webchick/Sites"
#RELEASE="8.x-dev"
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
cd prod

# Grab a "shallow copy" of the latest D8 code, since we just want the files, not# the whole history. Then blow away its .git folder so ours doesn't conflict.
git clone --branch 8.x --depth 1 http://git.drupal.org/project/drupal.git dee-eight
rm -rf dee-eight/.git

# Move all of the D8 files into prod and destroy the temp folder.
# @todo I could avoid all of this fuckery if git supported "svn export." :P
shopt -s dotglob
mv dee-eight/* .
rmdir dee-eight

# Now populate the prod Git repo.
git add .
git commit -m "Initial commit: Add all the D8 code files."
git push origin master
 
# @TODO: Patches?
wget https://drupal.org/files/issues/responsive-preview-1741498-422.patch
git apply --index responsive-preview-1741498-422.patch
git commit -am "Applying responsive preview patch."

wget https://drupal.org/files/issues/drupal8.config-site-uuid.28.patch
git apply --index drupal8.config-site-uuid.28.patch
git commit -am "Testing CMI site UUID patch."

# Still too buggy for now...
#wget https://drupal.org/files/issues/dropbutton-style-1989470-21.patch
#git apply --index dropbutton-style-1989470-21.patch
#git commit -am "Making more nicerer dropbuttons."

# Install Drupal 8: prod.
mysql -e "DROP DATABASE IF EXISTS prod; CREATE DATABASE prod;"
drush si --db-url=mysql://root:@127.0.0.1:33066/prod --account-pass=admin -y

# Hard-code site name to differentiate between sites. 
echo "
\$conf['system.site']['name'] = 'Drupal 8';" | sudo tee -a sites/default/settings.php

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
\$conf['system.site']['name'] = 'Drupal 8 [Dev]';
" | sudo tee -a sites/default/settings.php

# Copy over the prod config files to dev's directories.
export CONFIG_DIR=`find sites/default/files -type d -name "config*"`
mkdir `echo $CONFIG_DIR`/active_dev
mkdir `echo $CONFIG_DIR`/staging_dev
cp -r `echo $CONFIG_DIR`/active/* `echo $CONFIG_DIR`/active_dev/
cp -r `echo $CONFIG_DIR`/staging/* `echo $CONFIG_DIR`/staging_dev/
git add `echo $CONFIG_DIR`/active_dev
git add `echo $CONFIG_DIR`/staging_dev 
git commit -m "Adding dev CMI files."
git push origin master
 
# Clear zee cache.
drush cc all

