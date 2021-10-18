I'm happy to present you **Forging-Status-Bot v1.0.0**
*This tool is for forging delegates ONLY! (MainNet & TestNet).*
https://github.com/Gr33nDrag0n69/forging-status-bot/blob/main/README.md

This tool monitor lisk-core log file to detect when a new block is forged. Each time a new block is forged, it execute `lisk-core forging:status` and send the values to a public Discord server.

In the future, I intend to make my `lisk-forging-enable.sh` script to be able to load values from the Discord channel directly in case of disaster recovery.