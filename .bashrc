#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

shopt -s autocd # Auto cd on directory name

# Aliases
alias p="sudo pacman"
alias surf="tabbed surf -pe"
alias vim="nvim"
alias ls="ls --color=auto"
alias ll="ls -lhaG --color=auto"
alias config='/usr/bin/git --git-dir=/home/giuge/.cfg --work-tree=/home/giuge'

#PS1='[\u@\h \W]\$ '
export PS1="\[$(tput setaf 1)\][\[$(tput setaf 3)\]\u\[$(tput setaf 2)\]@\[$(tput setaf 6)\]\h \[$(tput setaf 7)\]\W\[$(tput setaf 1)\]]\[$(tput setaf 7)\]\\$ \[$(tput sgr0)\]"

if [[ -z $DISPLAY ]] && [[ $(tty) = /dev/tty1 ]]; then exec startx; fi

export XDG_CONFIG_HOME="$HOME/.config"
export PATH="$PATH:/usr/local/bin:~/.scripts"
export VISUAL="nvim"
export EDITOR="nvim"
export TERMINAL="st"
export BROWSER="chromium"
