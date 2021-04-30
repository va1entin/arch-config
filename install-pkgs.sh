#!/usr/bin/env bash

echo "Upgrading packages..."
sudo pacman -Syu
echo ""

echo "Iterating package lists..."
find pkgs/ -type f -name "*.list" -exec bash -c '
    read -n1 -p "Install packages from {} [y/n] " yn
    case "$yn" in
        [Yy]*)
            echo -e "\n\t Installing packages from {}"
            sudo pacman -S - < {}
            echo ""
            ;; \
        *)
            echo -e "\n\t Not installing packages from {}"
            echo ""
            ;;
    esac' \;

echo "Enabling docker..."
sudo systemctl enable docker.service
echo ""

echo "Starting docker..."
sudo systemctl start docker.service
echo ""
