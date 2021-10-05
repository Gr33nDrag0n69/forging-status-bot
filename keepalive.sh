#!/bin/bash

# Gr33nDrag0n 2021-10-04

ProcessCount=$( ps -ef | grep 'forging-status-bot/logmonitor.sh' | grep -v grep | wc -l )
if [ "$ProcessCount" -lt 1 ]
then
    "$HOME/forging-status-bot/start-logmonitor.sh"
fi
