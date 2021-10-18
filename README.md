![##Images_README_Header##](./img/discord_banner.png)

Send a 'forger-status' message every time a new block is forged by a delegate.

- [Join Bot Discord server.](#join-bot-discord-server)
- [Configure lisk-core log level.](#configure-lisk-core-log-level)
- [Configuration Note(s)](#configuration-notes)
- [Install Bot on Lisk server(s).9](#install-bot-on-lisk-servers9)
- [Script List](#script-list)
- [Clean Uninstall Bot on Lisk server(s).](#clean-uninstall-bot-on-lisk-servers)

## Join Bot Discord server.

Go to [https://discord.gg/RDstbDTKaH](https://discord.gg/RDstbDTKaH) to join the bot Discord server.

## Configure lisk-core log level.

This code REQUIRE that lisk-core node run with `info` log level. Validate your lisk-core log level configuration. It should look like this:

```json
  "logger": {
    "fileLogLevel": "info",
    "consoleLogLevel": "info"
  }
```

If you edited the configuration, don't forget to restart lisk-core for the new log level to apply.

## Configuration Note(s)

TODO!!!

* `logmonitor.sh` 
* 

## Install Bot on Lisk server(s).9

MANDATORY: The project is cloned in the home directory of the user: `$HOME/forging-status-bot/`.

```bash
# Clone project
cd "$HOME"
git clone "https://github.com/Gr33nDrag0n69/forging-status-bot.git"

# Make all bash scripts executable
chmod 0700 $HOME/forging-status-bot/*.sh

# Test send-message is working as expected.
$HOME/forging-status-bot/send-message.sh

# Start Log Monitor
$HOME/forging-status-bot/start-logmonitor.sh

# Install Keep Alive
$HOME/forging-status-bot/install-keepalive.sh
```

## Script List

```markdown
# send-message.sh

Send forging status message to Discord server.

# show-log.sh

Show the content of `forging-status-bot/logs/logmonitor.log`.

# logmonitor.sh

Monitor `$HOME/.lisk/lisk-core/logs/lisk.log` for `Forged new block`.
When a new block is forged, execute `forging-status-bot/send-message.sh`

# start-logmonitor.sh

Start `forging-status-bot/logmonitor.sh` as a background process.

# stop-logmonitor.sh

Kill all running instance of `forging-status-bot/logmonitor.sh` background process

# keepalive.sh

If `forging-status-bot/logmonitor.sh` background process isn't currently running, execute `forging-status-bot/start-logmonitor.sh`.

# install-keepalive.sh

Add crontab job to execute `keepalive.sh` once each minute.

# uninstall-keepalive.sh

Remove crontab job.
```

## Clean Uninstall Bot on Lisk server(s).

Use these steps to remove the tool from your server.

```bash
# Clean Crontab
$HOME/forging-status-bot/uninstall-keepalive.sh

# Stop Log-Watcher
$HOME/forging-status-bot/stop-logmonitor.sh

# Destroy Directory
rm -rf "$HOME/forging-status-bot/"

```
