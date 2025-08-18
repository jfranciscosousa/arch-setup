#!/bin/bash
# setup-nvidia.sh
# Configure NVIDIA kernel module options safely and update initramfs

set -e

CONF_FILE="/etc/modprobe.d/nvidia.conf"

# Lines we want to ensure exist
LINE1="options nvidia-drm fbdev=1"
LINE2="options nvidia NVreg_PreserveVideoMemoryAllocations=1"

echo ">>> Checking $CONF_FILE"

# Create file if it doesn't exist
if [ ! -f "$CONF_FILE" ]; then
    echo ">>> $CONF_FILE not found. Creating it..."
    sudo touch "$CONF_FILE"
fi

# Ensure LINE1 exists
if ! grep -Fxq "$LINE1" "$CONF_FILE"; then
    echo ">>> Adding missing line: $LINE1"
    echo "$LINE1" | sudo tee -a "$CONF_FILE" > /dev/null
else
    echo ">>> Line already present: $LINE1"
fi

# Ensure LINE2 exists
if ! grep -Fxq "$LINE2" "$CONF_FILE"; then
    echo ">>> Adding missing line: $LINE2"
    echo "$LINE2" | sudo tee -a "$CONF_FILE" > /dev/null
else
    echo ">>> Line already present: $LINE2"
fi

echo ">>> Updating initramfs..."
sudo update-initramfs -u

echo ">>> Done. Please reboot for changes to take effect."
