#!/bin/sh

# Clone repo
git clone https://github.com/mrf-dot/deb-bootstrap
cd deb-bootstrap || exit

# Install packages from packages.txt
sudo apt-get update
xargs sudo apt-get install -y < packages.txt

# Install Google Earth
wget "https://dl.google.com/dl/earth/client/current/google-earth-stable_current_amd64.deb" -O /tmp/google-earth-stable.deb
sudo dpkg -i /tmp/google-earth-stable.deb
sudo apt-get upgrade -y

# Install PowerShell
wget "https://packages.microsoft.com/config/ubuntu/$(lsb_release -rs)/packages-microsoft-prod.deb" -O /tmp/microsoft-prod.deb
sudo dpkg -i /tmp/microsoft-prod.deb
sudo apt-get update
sudo apt-get install -y powershell

# Install Ueberzug
pip3 install ueberzug

# Install Wine
sudo apt --install-recommends install winehq-devel

# Copy config files to their rightful directories
cp -r mpv ~/.config/
cp -r nvim ~/.config/
cp -r ranger ~/.config/
mkdir -p ~/.config/zsh/
cp zshrc ~/.config/zsh/.zshrc
cp zshenv ~/.zshenv
