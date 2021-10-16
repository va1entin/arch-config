#!/usr/bin/env bash

DESTINATION_NAME="ts5-client"

echo "Downloading ts5 client..."
wget -O "/tmp/$DESTINATION_NAME.tar.gz" https://files.teamspeak-services.com/teamspeak/teamspeak-client.tar.gz
echo ""

echo "Extracting ts5 client..."
sudo mkdir "/usr/local/bin/$DESTINATION_NAME"
sudo tar -xzvf "/tmp/$DESTINATION_NAME.tar.gz" -C "/usr/local/bin/$DESTINATION_NAME"
echo ""
