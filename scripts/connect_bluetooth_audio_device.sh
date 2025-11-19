#!/usr/bin/env bash

# connect_bluetooth_audio_device.sh <mac address> <device name as seen in wpctl status>

bluetoothctl connect "$1"

id=""
while [ -z "$id" ]; do
    id=$(wpctl status | grep -Eo "[0-9]*\. $2 .*vol" | sed 's/\..*//g')
    sleep 1
done

wpctl set-default "$id"
