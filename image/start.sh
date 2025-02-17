#!/bin/bash

# Check if /var/www/html is empty
if [ -z "$(ls -A /var/www/html)" ]; then
    echo "Directory /var/www/html is empty, copying Drupal files..."
    # Find the drupal directory under /tmp
    DRUPAL_DIR=$(find /tmp -maxdepth 1 -type d -name "drupal-*" | sort -V | tail -n 1)
    if [ -n "$DRUPAL_DIR" ]; then
        echo "Found Drupal directory: $DRUPAL_DIR"
        cp -r $DRUPAL_DIR/* $DRUPAL_DIR/.[!.]* /var/www/html/
        chown -R www-data:www-data /var/www/html
        echo "Drupal files copied successfully"
    else
        echo "Error: Drupal directory not found in /tmp"
        exit 1
    fi
fi

# Ensure the directory exists
mkdir -p /var/www/html/log/supervisor

# Set the correct owner and permissions
chown -R www-data:www-data /var/www/html/log
chmod -R 755 /var/www/html/log

# Start supervisord
exec /usr/bin/supervisord -n -c /etc/supervisor/supervisord.conf