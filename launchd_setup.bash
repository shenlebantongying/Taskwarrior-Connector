#!/usr/bin/env bash

prog="taskwarrior_connector"
label="org.taskwarrior.connector"

__launchdplist="<?xml version=\"1.0\" encoding=\"UTF-8\"?>
<!DOCTYPE plist PUBLIC -//Apple Computer//DTD PLIST 1.0//EN http://www.apple.com/DTDs/PropertyList-1.0.dtd >
<plist version=\"1.0\">
  <dict>
    <key>Label</key>
    <string>${label}</string>
    <key>Program</key>
    <string>$(dirname "$(realpath "$0")")/${prog}.py</string>
    <key>KeepAlive</key>
    <true/>
  </dict>
</plist>"

echo "${__launchdplist}" > ~/Library/LaunchAgents/${label}.plist
launchctl load ~/Library/LaunchAgents/${label}.plist

#TODO: Can macOS allow query service status without sudo?