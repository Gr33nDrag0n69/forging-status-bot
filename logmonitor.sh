#!/bin/bash

# Gr33nDrag0n 2021-10-04

LiskLogFile="$HOME/.lisk/lisk-core/logs/lisk.log"

tail -Fn0 "$LiskLogFile" | \
while read -r Line ; do
    if [[ $Line == *"Forged new block"* ]]; then
        sleep 1
        GeneratorAddress=$( echo "$Line" | jq -r '.meta.generatorAddress' )
        Height=$( echo "$Line" | jq '.meta.height' )

        echo '--------------------------------------------------------------------------------'
        echo "$Height $GeneratorAddress Forged New Block"
        echo '--------------------------------------------------------------------------------'

        "$HOME/forging-status-bot/send-message.sh" -a "$GeneratorAddress"
    fi
done
