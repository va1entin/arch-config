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

echo "Getting pipewire audio sink ID of connected device..."
while true; do
    id=$(pw-dump -N | jq '.[] | select((.info.props["media.class"]) == "Audio/Sink" and ( (.info.props["api.bluez5.address"]) == "'$1'") or ((.info.props["node.name"]) == "bluez_output.'$1'")) | .id')
    if [ -n "$id" ]; then
        echo "Audio sink ID found."
        break
    else
        sleep 1
    fi
done

echo "Setting connected device as default pipewire sink..."
wpctl set-default "$id"
