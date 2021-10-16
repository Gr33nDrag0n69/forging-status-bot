#!/bin/bash

###############################################################################
# Author  :   Gr33nDrag0n
# Version :   1.0.0
# GitHub  :   https://github.com/Gr33nDrag0n69/forging-status-bot
# History :   2021/10/15 - v1.0.0
###############################################################################

ProcessCount=$( pgrep -f 'forging-status-bot/logmonitor.sh' -c )

if [ "$ProcessCount" -lt 1 ]
then
    "$HOME/forging-status-bot/start-logmonitor.sh"
fi
