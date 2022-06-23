# deb-bootstrap

A repository containing my config (dot) files and installed packages

## What's in the Repo?

This repository is primarily composed of three parts:

1. A list of packages installed on my system
2. Config files that are used on my system
3. The location of where the config files should be located
4. An automated install script

## Automated install

To complete all the instructions listed in this README automatically, execute
the following command.

```sh
curl https://raw.githubusercontent.com/mrf-dot/deb-bootstrap/main/install.sh | sh
```

## Intended Audience

This repository is primarily for myself. It is always good to store your files
in multiple locations in the event of an issue.

## Packages

The file `packages.txt` contains a list of packages installed on my system. You
should go through the file, line by line, and decide which files you would like
to install on your system. Two packages that I have installed require more
setup than simply using `apt install`. I have noted the install process for
these packages below.

Google Earth:

```sh
sudo apt-get update
wget "https://dl.google.com/dl/earth/client/current/google-earth-stable_current_amd64.deb" -O /tmp/google-earth-stable.deb
sudo dpkg -i /tmp/google-earth-stable.deb
sudo apt-get upgrade -y
```

Powershell:

```sh
sudo apt-get update
wget "https://packages.microsoft.com/config/ubuntu/$(lsb_release -rs)/packages-microsoft-prod.deb" -O /tmp/microsoft-prod.deb
sudo dpkg -i /tmp/microsoft-prod.deb
sudo apt-get update
sudo apt-get install -y powershell
```

Ueberzug:

```sh
pip3 install ueberzug
```

Wine:

```sh
sudo apt --install-recommends install winehq-devel
```

## Configuration Files

This repository has a few config files that are used by various system-critical
programs. Currently located in the repository are configuration files for mpv
(video player), neovim (command line text editor based on vim), ranger (command
line file manager), and zsh (shell). The file `locations.txt` contains the
locations in the system where these config files must be located in order to be
recognized. Using this shell command all files may be relocated automatically

```sh
git clone https://github.com/mrf-dot/deb-bootstrap
cp -r deb-bootstrap/mpv ~/.config/
cp -r deb-bootstrap/nvim ~/.config/
cp -r deb-bootstrap/ranger ~/.config/
mkdir -p ~/.config/zsh/
cp deb-bootstrap/zshrc ~/.config/zsh/.zshrc
cp deb-bootstrap/zshenv ~/.zshenv
```

## A Piece of Advice

Once your system is installed it is ***highly*** suggested that you make
backups of your system. I use two programs for this. Firstly, I use timeshift
to make backups of system files. Secondly, I use deja-dup to backup my personal
files to an external hard drive. Making regular backups is the best way to
preserve your system against stupid mistakes and random errors.
