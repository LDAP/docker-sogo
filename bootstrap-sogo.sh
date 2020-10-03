#!/bin/bash

# Copy back default config

if [ ! -f /etc/sogo/sogo.conf ]; then
  echo "Copy back default config"
  cp -a /defaults/sogo/. /etc/sogo/
  chown -R sogo:sogo /etc/sogo
  chmod 0644 /etc/sogo/sogo.conf
fi

# Chown backup path
chown -R sogo:sogo /sogo_backup

# Creating cronjobs

echo "* * * * *   sogo   /usr/sbin/sogo-ealarms-notify -p /etc/sogo/sieve.creds 2>/dev/null" > /etc/cron.d/sogo
echo "* * * * *   sogo   /usr/sbin/sogo-tool expire-sessions ${SOGO_EXPIRE_SESSION}" >> /etc/cron.d/sogo
echo "0 0 * * *   sogo   /usr/sbin/sogo-tool update-autoreply -p /etc/sogo/sieve.creds" >> /etc/cron.d/sogo
echo "0 2 * * *   sogo   /usr/sbin/sogo-tool backup /sogo_backup ALL" >> /etc/cron.d/sogo

echo "Starting sogo..."
exec gosu sogo /usr/sbin/sogod
