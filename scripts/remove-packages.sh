#!/bin/bash

echo "Removing unused packages..."

sudo pacman -Runs micro gnome-settings alacritty epiphany meld firefox gedit || true
