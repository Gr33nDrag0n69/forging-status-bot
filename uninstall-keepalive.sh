#!/bin/bash

###############################################################################
# Author  :   Gr33nDrag0n
# Version :   1.0.0
# GitHub  :   https://github.com/Gr33nDrag0n69/forging-status-bot
# History :   2021/10/04 - v1.0.0
###############################################################################

tmp=${TMPDIR:-/tmp}/forging-status-bot.$$

# Capture crontab & delete command if exist
crontab -l | sed '/forging-status-bot\/keepalive.sh/d' > $tmp

# Write new crontab
crontab < $tmp

# Remove tmp file
rm -f $tmp

