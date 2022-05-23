#!/bin/zsh

# abbreviations
alias lsp="exa -lh"
alias grep="grep --color"
alias o=xdg-open
alias zshc="$EDITOR $ZDOTDIR/.zshrc"
alias vc="$EDITOR $XDG_CONFIG_HOME/nvim/init.vim"
alias mpvc="$EDITOR $XDG_CONFIG_HOME/mpv/mpv.conf"
alias diff="diff --color=always"

# Configure history
export HISTFILE="$ZDOTDIR/zsh_history"
export HISTSIZE=10000
export SAVEHIST=10000

# Basic auto/tab complete
autoload -U compinit
zstyle ':completion:*' menu select
zmodload zsh/complist
compinit
_comp_options+=(globdots)

# Enable VI mode
bindkey -v
export KEYTIMEOUT=1
bindkey -M menuselect 'h' vi-backward-char
bindkey -M menuselect 'k' vi-up-line-or-history
bindkey -M menuselect 'l' vi-forward-char
bindkey -M menuselect 'j' vi-down-line-or-history
bindkey -v '^?' backward-delete-char
autoload edit-command-line
zle -N edit-command-line
bindkey '^e' edit-command-line

# Use ranger to change directories
bindkey -s '^O' '. ranger\n'

# Solve equations
m() {
	giac $1 2>/dev/null
}

# View history
h() {
	< $ZDOTDIR/zsh_history
}

# ping google
p() {
	ping google.com
}

# Upgrade Pop-OS
upgrade() {
	sudo apt update -y && sudo apt full-upgrade -y --allow-downgrades && pop-upgrade recovery upgrade from-release && pop-upgrade release upgrade
}

# Write an entry in the VI journal
viwiki() {
	$EDITOR $HOME/wiki/text/index.wiki
}

# Transfer files to your root directory
toroot(){
	sudo mv $@ /root/
}


# Install software (Ubuntu only)
get(){
	yes | sudo apt update
	yes | sudo apt upgrade
	yes | sudo apt install $@
}

# Remove software (Ubuntu only)
rid(){
	yes | sudo apt purge $@
	yes | sudo apt autoremove
	yes | sudo apt clean all
	yes | sudo apt autoclean
	pkill $@
}

# Install shell scripts
binst() {
	chmod +x $1
	sudo mv $1 /usr/local/bin
}

# List operating system properties
os(){
	echo Kernel: $(uname -s)
	echo Hostname: $(uname -n)
	echo Release: $(uname -r)
	echo Version: $(uname -v)
	echo Machine: $(uname -m)
	echo Processor: $(uname -p)
	echo Hardware: $(uname -i)
	echo Operating System: $(uname -o)
}

# Compile documents to pdf with groff
roff () {
	[ -z $1 ] && echo "Please provide a valid troff file" || grog -Tpdf $1 --run > "${1:r}.pdf"
}

# Play music on the command line
music (){
	[ -z $1 ] && mpv $HOME/Music/*.mp3 --shuffle --no-video --no-resume-playback || mpv $HOME/Music/$1* --shuffle --no-video --no-resume-playback
}

# Compile Java files in a project
jp (){
	mkdir -p ../../../bin && rm -f ../../../${1:r}.class && javac -d ../../../bin $1 && java -cp ../../../bin ${1:r}
}

# Compile C files in a project
cc (){
	mkdir -p ../../../bin && rm -f ../../../bin/${1:r} && gcc $1 -o ../../../bin/${1:r} && ../../../bin/${1:r}
}

# Compile C++ files in a project
ccpp (){
	mkdir -p ../../../bin && rm -f ../../../bin/${1:r} && g++ $1 -o ../../../bin/${1:r} && ../../../bin/${1:r} $1
}

# Compile C# files in a project
ccs () {
	mkdir -p ../../../bin && rm -f ../../../bin/"${1:r}.exe" && mcs -out:"../../../bin/${1:r}.exe" $1 && mono ../../../bin/"${1:r}.exe"
}

# Create a code project
mproj (){
	mkdir $1 && cd $1 && echo "# $1" > README.md && touch LICENSE && echo "bin/" > .gitignore && mkdir -p {bin,src/{main,test}/resources} && git init >/dev/null
}

# Convert any text to a formatted pdf
code2pdf (){
        nvim --headless -c "set bg=light | highlight Normal ctermbg=255 | TOhtml | write! ${1:r}.tmp.html | quitall!" $1 2>/dev/null && wkhtmltopdf -q "${1:r}.tmp.html" "${1:r}.pdf" && rm "${1:r}.tmp.html"
}

PROMPT='%~ %# '
