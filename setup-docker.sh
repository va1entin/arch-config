#!/usr/bin/env bash

echo "Enabling docker..."
sudo systemctl enable docker.service
echo ""

echo "Starting docker..."
sudo systemctl start docker.service
echo ""
