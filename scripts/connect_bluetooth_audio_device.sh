#!/usr/bin/env bash

# connect_bluetooth_audio_device.sh <mac address> <device name as seen in wpctl status>

systemctl status bluetooth.service 2>&1 > /dev/null
if [ $? -ne 0 ]; then
    echo "bluetooth.service is $(systemctl is-enabled bluetooth.service) and not running."
    echo "Please make sure it's started successfully first."
    exit 1
fi

connected=1
while [ $connected -ne 0 ]; do
    bluetoothctl connect "$1"
    connected=$?
done

id=""
while [ -z "$id" ]; do
    id=$(wpctl status | grep -Eo "[0-9]*\. $2 .*vol" | sed 's/\..*//g')
    sleep 1
done

wpctl set-default "$id"
