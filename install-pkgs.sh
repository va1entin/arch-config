#!/usr/bin/env bash

echo "Upgrading packages and installing yay..."
sudo pacman -Syu yay
echo ""

echo "Setting yay config..."
yay -Y --cleanafter --save
echo ""

echo "Iterating package lists..."
find pkgs/ -type f -name "*.list" -exec bash -c '
    read -n1 -p "Install packages from {} [y/n] " yn
    case "$yn" in
        [Yy]*)
            echo -e "\n\t Installing packages from {}"
            sudo yay -S - < {}
            echo ""
            ;; \
        *)
            echo -e "\n\t Not installing packages from {}"
            echo ""
            ;;
    esac' \;
