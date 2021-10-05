#!/bin/bash

###############################################################################
# Author  :   Gr33nDrag0n
# Version :   1.0.0
# GitHub  :   https://github.com/Gr33nDrag0n69/forging-status-bot
# History :   2021/10/04 - v1.0.0
###############################################################################

ProcessCount=$( ps -ef | grep 'forging-status-bot/logmonitor.sh' | grep -v grep | wc -l )
if [ "$ProcessCount" -lt 1 ]
then
    "$HOME/forging-status-bot/start-logmonitor.sh"
fi
