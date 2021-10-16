#!/bin/bash

###############################################################################
# Author  :   Gr33nDrag0n
# Version :   1.0.0
# GitHub  :   https://github.com/Gr33nDrag0n69/forging-status-bot
# History :   2021/10/15 - v1.0.0
###############################################################################

pgrep -f 'forging-status-bot/logmonitor.sh' | xargs -r kill -9 &>/dev/null
