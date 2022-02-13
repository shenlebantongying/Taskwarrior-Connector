#!/usr/bin/env bash

prog="taskwarrior_connector"

__sysdunitfile="[Unit]
Description=TaskWarrior Connector

[Service]
Type=simple
StandardOutput=journal
ExecStart=$(dirname "$(realpath "$0")")/${prog}.py

[Install]
WantedBy=default.target"

echo "$__sysdunitfile" > ~/.config/systemd/user/${prog}.service

systemctl --user enable ${prog}.service
systemctl --user start ${prog}.service
systemctl --user status ${prog}.service
