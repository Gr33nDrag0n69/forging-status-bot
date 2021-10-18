#!/bin/bash

###############################################################################
# Author  :   Gr33nDrag0n
# Version :   1.0.0
# GitHub  :   https://github.com/Gr33nDrag0n69/forging-status-bot
# History :   2021/10/17 - v1.0.0
###############################################################################

source "$HOME/forging-status-bot/CONFIG"

#------------------------------------------------------------------------------

if [ ! -f "$LiskCoreBinaryFullPath" ]
then
    echo "Error: lisk-core Binary NOT FOUND! Edit 'LiskCoreBinaryFullPath' value in 'CONFIG' & retry."
else
    echo "lisk-core binary FOUND!"
fi

if [ ! -f "$LiskLogFile" ]
then
    echo "Error: lisk-core log file NOT FOUND! Edit 'LiskLogFile' value in 'CONFIG' & retry."
else
    echo "lisk-core log file FOUND!"
fi
