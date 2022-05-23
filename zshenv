#!/bin/zsh

# Default Programs
export EDITOR="nvim"
export TERMINAL="gnome-terminal"
export BROWSER="firefox"
export PAGER="less"

# Set XDG Variables
export XDG_CACHE_HOME="$HOME/.cache"
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_STATE_HOME="$HOME/.local/state"

# ~/ Clean-up:
export CARGO_HOME="$XDG_DATA_HOME"/cargo
export CUDA_CACHE_PATH="$XDG_CACHE_HOME"/nv
export GIT_CONFIG="$XDG_CONFIG_HOME"/git/config
export GNUPGHOME="$XDG_DATA_HOME"/gnupg
export LESSHISTFILE="$XDG_CACHE_HOME"/less/history
export MOZILLA="$XDG_CACHE_HOME"/mozilla
export RUSTUP_HOME="$XDG_DATA_HOME"/rustup
export ZDOTDIR="$XDG_CONFIG_HOME"/zsh

# Set Path
export PATH="$HOME/.local/bin:$CARGO_HOME/bin:$PATH"
