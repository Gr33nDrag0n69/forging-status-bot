#!/bin/bash

# Gr33nDrag0n 2021-10-04

tmp=${TMPDIR:-/tmp}/forging-status-bot.$$

# Capture crontab & delete command if exist
crontab -l | sed '/forging-status-bot\/keepalive.sh/d' > $tmp

# Add command
echo '*/1 * * * * /bin/bash ~/forging-status-bot/keepalive.sh > /dev/null 2>&1' >> $tmp

# Write new crontab
crontab < $tmp

# Remove tmp file
rm -f $tmp
