#!/bin/sh
# Give execution rights on the cron job
chmod 0644 /etc/crontabs/crontab

# configure crontab
crontab /etc/crontabs/crontab

# launch crond
crond -f
