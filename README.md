# forging-status-bot - NOT READY FOR PRODUCTION!

Discord Bot that will send forger-status message every time a new block is forged by a local forging delegate.

- [forging-status-bot - NOT READY FOR PRODUCTION!](#forging-status-bot---not-ready-for-production)
  - [Warning(s)](#warnings)
  - [Join Bot Discord server.](#join-bot-discord-server)
  - [Install Bot on Lisk server(s).](#install-bot-on-lisk-servers)
  - [Script List](#script-list)

## Warning(s)

* The project MUST be cloned in the home directory of the user: `$HOME/forging-status-bot/`.
* There is currently no config file in the project and some things are hard coded.
* This code require that the target lisk-core node run with `info` log level.

## Join Bot Discord server.

[forging-status-bot](https://discord.gg/RDstbDTKaH)

## Install Bot on Lisk server(s).

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

Send forging status message using cofigured method(s).

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
