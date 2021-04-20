#!/usr/bin/env bash

sudo pacman -S syncthing

systemctl enable --user syncthing.service
systemctl start --user syncthing.service
