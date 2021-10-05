#!/bin/bash

# Gr33nDrag0n 2021-10-04

nohup "$HOME/forging-status-bot/logmonitor.sh" </dev/null &>"$HOME/forging-status-bot/logs/logmonitor.log" &
