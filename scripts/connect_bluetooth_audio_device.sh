#!/usr/bin/env bash

bluetoothctl connect "$1"

id=""
while [ -z "$id" ]; do
    id=$(wpctl status | grep -Eo '[0-9]*\. WH-1000XM4 .*vol' | sed 's/\..*//g')
    sleep 1
done

wpctl set-default "$id"
