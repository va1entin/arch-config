#!/usr/bin/env bash

# connect_bluetooth_audio_device.sh <mac address>

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

while true; do
    id=$(pw-dump -N | jq '.[] | select((.info.props["media.class"]) == "Audio/Sink" and (.info.props["api.bluez5.address"]) == "'$1'") | .id')
    if [ -n "$id" ]; then
        break
    else
        sleep 1
    fi
done

wpctl set-default "$id"
