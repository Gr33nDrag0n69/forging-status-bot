#!/bin/bash

# Gr33nDrag0n 2021-10-04

LiskCoreBinaryFullPath="$HOME/lisk-core/bin/lisk-core"

DiscordServerID='894759637914632222'

#------------------------------------------------------------------------------

BinaryAddress="N/A"

while getopts a: flag
do
    case "${flag}" in

        a)
            BinaryAddress=${OPTARG}
            ;;

        *)
            echo "Error: Invalid Parameter(s)." >&2
            exit 1
            ;;
    esac
done

#------------------------------------------------------------------------------

if [ ! -f "$LiskCoreBinaryFullPath" ]
then
    echo "Error: lisk-core Binary NOT FOUND! Edit 'LiskCoreBinaryFullPath' value & retry. Aborting..." >&2
    exit 1
fi

NetworkIdentifier=$( "$LiskCoreBinaryFullPath" node:info 2>/dev/null | jq -r '.networkIdentifier' )

if [ -z "$NetworkIdentifier" ]
then
    echo "Error: 'lisk-core node:info' is empty. Validate the lisk-core process is currently running." >&2
    exit 1
fi

case $NetworkIdentifier in
    "4c09e6a781fc4c7bdb936ee815de8f94190f8a7519becd9de2081832be309a99")
        # MAINNET
        DiscordWebhookToken='XU4FfSZpkGmADYlmbQWuSvHZfo_Bjulf89rYA9wgd78eTQSWpUDbNSqCCOiYLdXSYkcX'
        ;;

    "15f0dacc1060e91818224a94286b13aa04279c640bd5d6f193182031d133df7c")
        # TESTNET
        DiscordWebhookToken='gq8g8dQ6ttbb_B6uuU5L1VGW7ifDCP_RjMh1GvkY2TokJ1oOyov83vvISRdiU_1uFrX9'
        ;;

    *)
        # Invalid Network
        echo "Error: 'lisk-core node:info' NetworkIdentifier is INVALID." >&2
        exit 1
        ;;
esac

WebHookUrl="https://discord.com/api/webhooks/$DiscordServerID/$DiscordWebhookToken"

#------------------------------------------------------------------------------

NodeInfo=$( "$LiskCoreBinaryFullPath" node:info 2>/dev/null )

if [ -z "$NodeInfo" ]
then
    echo "Error: 'lisk-core node:info' is empty. Validate the lisk-core process is currently running." >&2
    exit 1
else
    NodeSyncing=$( echo "$NodeInfo" | jq -r '.syncing' )

    if [ "$NodeSyncing" = false ]
    then
        ForgingStatus=$( "$LiskCoreBinaryFullPath" forging:status 2>/dev/null )
        
        if [ -z "$ForgingStatus" ]
        then
            echo "Error: 'lisk-core forging:status' is empty." >&2
            exit 1
        else

            DelegateInfo=$( echo "$ForgingStatus" | jq ".[] | select(.address == \"$BinaryAddress\")" )

            if [ -z "$DelegateInfo" ]
            then
                echo "Error: 'DelegateInfo' is empty for BinaryAddress '$BinaryAddress'." >&2
                exit 1
            else
                Height=$( echo "$DelegateInfo" | jq -r '.height // 0' )
                MaxHeightPreviouslyForged=$( echo "$DelegateInfo" | jq -r '.maxHeightPreviouslyForged // 0' )
                MaxHeightPrevoted=$( echo "$DelegateInfo" | jq -r '.maxHeightPrevoted // 0' )

                if [ "$Height" -gt 0 ] && [ "$MaxHeightPreviouslyForged" -gt 0 ] && [ "$MaxHeightPrevoted" -gt 0 ]
                then
                    DelegateName=$( "$LiskCoreBinaryFullPath" account:get "$BinaryAddress" | jq -r '.dpos.delegate.username' )

                    if [ -z "$DelegateName" ]
                    then
                        echo "Error: 'DelegateName' is empty for BinaryAddress '$BinaryAddress'." >&2
                        exit 1
                    else
                        Message="$DelegateName\n$BinaryAddress\n$Height $MaxHeightPreviouslyForged $MaxHeightPrevoted"
                        echo "DEBUG WebHookUrl: '$WebHookUrl'"
                        curl -s -H "Content-Type: application/json" -X POST -d "{\"content\": \"$Message\"}" "$WebHookUrl"
                    fi
                else
                    echo "Error: Invalid Value(s). $Height $MaxHeightPreviouslyForged $MaxHeightPrevoted" >&2
                    exit 1
                fi
            fi
        fi
    else
        echo "Warning : Node is currently syncing."
    fi
fi

exit 0
