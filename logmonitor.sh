#!/bin/bash

###############################################################################
# Author  :   Gr33nDrag0n
# Version :   1.0.0
# GitHub  :   https://github.com/Gr33nDrag0n69/forging-status-bot
# History :   2021/10/15 - v1.0.0
###############################################################################

# Default Configuration

LiskLogFile="$HOME/.lisk/lisk-core/logs/lisk.log"

#------------------------------------------------------------------------------

if [ ! -f "$LiskLogFile" ]
then
    echo "Error: lisk-core log file NOT FOUND! Edit 'LiskLogFile' value in 'logmonitor.sh' & retry. Aborting..." >&2
    exit 1
fi

#------------------------------------------------------------------------------

tail -Fn0 "$LiskLogFile" | \
while read -r Line ; do
    if [[ $Line == *"Forged new block"* ]]; then
        sleep 1
        printf -v Date '%(%Y-%m-%d %H:%M:%S)T' -1
        GeneratorAddress=$( echo "$Line" | jq -r '.meta.generatorAddress' )
        Height=$( echo "$Line" | jq '.meta.height' )

        echo "$Date $Height $GeneratorAddress Forged New Block"

        "$HOME/forging-status-bot/send-message.sh" -a "$GeneratorAddress"
    fi
done
