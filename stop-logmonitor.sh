#!/bin/bash

# Gr33nDrag0n 2021-10-04

ps -ef | grep "$HOME/forging-status-bot/logmonitor.sh" | grep -v grep | awk '{print $2}' | xargs -r kill -9 &>/dev/null
