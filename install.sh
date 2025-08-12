#!/bin/bash

# Exit immediately if a command exits with a non-zero status
set -e

# Disable lock screen
gsettings set org.gnome.desktop.screensaver lock-enabled false
gsettings set org.gnome.desktop.session idle-delay 0

source ~/.local/share/jfranciscosousa-arch-setup/scripts/base.sh
source ~/.local/share/jfranciscosousa-arch-setup/scripts/terminal.sh
source ~/.local/share/jfranciscosousa-arch-setup/scripts/theme.sh

# Enable lock screen again
gsettings set org.gnome.desktop.screensaver lock-enabled true
gsettings set org.gnome.desktop.session idle-delay 300
