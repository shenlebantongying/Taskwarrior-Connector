#!/usr/bin/env bash

prog="taskwarrior_connector"

systemctl --user disable ${prog}.service
systemctl --user stop ${prog}.service

rm -f ~/.config/systemd/user/${prog}.service
