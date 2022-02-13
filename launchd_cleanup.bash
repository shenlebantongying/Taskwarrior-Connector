#!/usr/bin/env bash

label="org.taskwarrior.connector"

launchctl unload ~/Library/LaunchAgents/${label}.plist
rm -f ~/Library/LaunchAgents/${label}.plist