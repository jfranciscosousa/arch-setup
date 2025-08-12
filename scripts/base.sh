#!/bin/bash

echo "Installing base development packages..."
sudo pacman -S --noconfirm base-devel

echo "Installing yay..."
sudo pacman -S --noconfirm yay
