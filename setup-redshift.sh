#!/usr/bin/env bash

echo "Installing redshift..."
yay -S redshift
echo ""


echo "Enabling redshift user service..."
systemctl --user enable redshift.service
echo ""

echo "Add redshift config like the following sample at path ~/.config/redshift/redshift.conf"
echo "[redshift]
temp-night=3700
location-provider=manual

[manual]
lat=<lat>
lon=<lon>"
echo ""

echo "Run to start redshift user service: systemctl --user start redshift.service"
