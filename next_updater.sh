#!/usr/bin/env bash

read -p "WARNING! This will attempt an upgrade of Nextcloud. Press any key to continue." -n1 -s
cd /var/www/html/updater/
if [[ "$PWD" = /var/www/html/updater ]]; then
sudo -u www-data php updater.phar
echo "Script finished."
cd
else
echo "Error: can not cd into /var/www/html/updater/"
fi
