#!/bin/bash

echo "Installing terminal tools..."
echo "Installing zsh..."
sudo pacman -S --noconfirm zsh direnv ghostty

echo "Installing zgen..."
rm -rf "${HOME}/.zgen"
git clone https://github.com/tarjoilija/zgen.git "${HOME}/.zgen"

echo "Installing asdf..."
yay -S --noconfirm asdf-vm
asdf plugin add nodejs
asdf plugin add pnpm
asdf plugin add deno
asdf plugin add ruby
asdf plugin add erlang
asdf plugin add elixir

echo "Installing nodejs..."
asdf install nodejs latest
echo "Installing pnpm..."
asdf install pnpm latest
echo "Installing deno..."
asdf install deno latest
echo "Installing ruby..."
asdf install ruby latest
echo "Installing erlang..."
asdf install erlang latest
echo "Installing elixir..."
asdf install elixir 1.18.4

asdf set -u nodejs latest
asdf set -u pnpm latest
asdf set -u deno latest
asdf set -u ruby latest
asdf set -u erlang latest
asdf set -u elixir 1.18.4

echo "Installing postgresql..."
sudo pacman -S --noconfirm postgresql
sudo -u postgres rm -rf /var/lib/postgres/data
sudo -u postgres mkdir /var/lib/postgres/data
sudo -u postgres initdb --locale=C.UTF-8 --encoding=UTF8 -D /var/lib/postgres/data --data-checksums
sudo systemctl start postgresql.service
sudo -u postgres createuser $USER --no-password --superuser
createdb $USER

echo "Installing chezmoi..."
sudo pacman -S --noconfirm chezmoi
chezmoi init
cd ~/.local/share/chezmoi
rm -rf .git
git clone https://github.com/jfranciscosousa/dotfiles.git .
chezmoi apply
# Now put it back into SSH, we'll configure this manually after the install
git remote set-url origin git@github.com:jfranciscosousa/dotfiles.git
