#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

shopt -s autocd # Auto cd on directory name

# Aliases
alias surf="tabbed surf -pe"
alias vim="nvim"
alias ls="ls -hN --color=auto --group-directories-first"
alias ll="ls -lhaG --color=auto"
alias diff="diff --color=always"
alias config='/usr/bin/git --git-dir=/home/giuge/.cfg --work-tree=/home/giuge'
alias wifi-menu='wifi-menu -o'
alias led='ledger -f ~/.personal/ledger/journal.ledger'
alias todo="todoist"

#PS1='[\u@\h \W]\$ '
export PS1="\[$(tput setaf 1)\][\[$(tput setaf 3)\]\u\[$(tput setaf 2)\]@\[$(tput setaf 6)\]\h \[$(tput setaf 7)\]\W\[$(tput setaf 1)\]]\[$(tput setaf 7)\]\\$ \[$(tput sgr0)\]"

export XDG_CONFIG_HOME="$HOME/.config"
export PATH="$PATH:/usr/local/bin:$HOME/.local/bin:$HOME/.scripts:$HOME/go/bin:$HOME/.nimble/bin"
export VISUAL="nvim"
export EDITOR="nvim"
export TERM="st-256color"
export BROWSER="firefox"
export SUDO_ASKPASS="x11-ssh-askpass"

if [[ -z $DISPLAY ]] && [[ $(tty) = /dev/tty1 ]]; then
    exec startx;
fi

[ -f ~/.fzf.bash ] && source ~/.fzf.bash
