#!/bin/bash

###############################################################################
# Author  :   Gr33nDrag0n
# Version :   1.0.0
# GitHub  :   https://github.com/Gr33nDrag0n69/forging-status-bot
# History :   2021/10/04 - v1.0.0
###############################################################################

nohup "$HOME/forging-status-bot/logmonitor.sh" </dev/null &>"$HOME/forging-status-bot/logs/logmonitor.log" &
