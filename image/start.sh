#!/bin/bash

# Ensure the directory exists
mkdir -p /var/www/html/log/supervisor

# Set the correct owner and permissions
chown -R www-data:www-data /var/www/html/log
chmod -R 755 /var/www/html/log

# Start supervisord
exec /usr/bin/supervisord -n -c /etc/supervisor/supervisord.conf