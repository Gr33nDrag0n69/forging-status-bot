#!/bin/bash

# Gr33nDrag0n 2021-10-04

Delegate="N/A"
Height="N/A"

while getopts d:h: flag
do
    case "${flag}" in
        d)
            FullDelegate=${OPTARG}
            Delegate="${FullDelegate::5}...${FullDelegate: -5}"
            ;;

        h)
            Height=${OPTARG};;
    esac
done


# MainNet
#WebHookUrl='https://discord.com/api/webhooks/894759637914632222/XU4FfSZpkGmADYlmbQWuSvHZfo_Bjulf89rYA9wgd78eTQSWpUDbNSqCCOiYLdXSYkcX'

# TestNet
WebHookUrl='https://discord.com/api/webhooks/894769566671061022/gq8g8dQ6ttbb_B6uuU5L1VGW7ifDCP_RjMh1GvkY2TokJ1oOyov83vvISRdiU_1uFrX9'

Message="$Delegate (BinaryAddress) Height: N/A MaxHeightPreviouslyForged: N/A MaxHeightPrevoted: N/A"

curl -H "Content-Type: application/json" -X POST -d "{\"content\": \"$Message\"}" "$WebHookUrl"


#echo "Writing 'Forging Status Json File'."
echo $( "$HOME/lisk-core/bin/lisk-core" forging:status | jq '.' )

