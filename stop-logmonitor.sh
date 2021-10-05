#!/bin/bash

###############################################################################
# Author  :   Gr33nDrag0n
# Version :   1.0.0
# GitHub  :   https://github.com/Gr33nDrag0n69/forging-status-bot
# History :   2021/10/04 - v1.0.0
###############################################################################

ps -ef | grep "$HOME/forging-status-bot/logmonitor.sh" | grep -v grep | awk '{print $2}' | xargs -r kill -9 &>/dev/null
