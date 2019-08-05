#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

shopt -s autocd # Auto cd on directory name

# Aliases
alias surf="tabbed surf -pe"
alias vim="nvim"
alias ls="ls --color=auto"
alias ll="ls -lhaG --color=auto"
alias config='/usr/bin/git --git-dir=/home/giuge/.cfg --work-tree=/home/giuge'
alias wifi-menu='wifi-menu -o'
alias led='ledger -f ~/ledger/journal.ldg'

#PS1='[\u@\h \W]\$ '
export PS1="\[$(tput setaf 1)\][\[$(tput setaf 3)\]\u\[$(tput setaf 2)\]@\[$(tput setaf 6)\]\h \[$(tput setaf 7)\]\W\[$(tput setaf 1)\]]\[$(tput setaf 7)\]\\$ \[$(tput sgr0)\]"

export XDG_CONFIG_HOME="$HOME/.config"
export PATH="$PATH:/usr/local/bin:$HOME/.local/bin:$HOME/.scripts:$HOME/go/bin"
export VISUAL="nvim"
export EDITOR="nvim"
export TERMINAL="st"
export BROWSER="firefox"
export SUDO_ASKPASS="x11-ssh-askpass"

export QT_AUTO_SCREEN_SCALE_FACTOR=0
export QT_SCALE_FACTOR=1.5
export QT_STYLE_OVERRIDE=adwaita
export QT_FONT_DPI=120

if [[ -z $DISPLAY ]] && [[ $(tty) = /dev/tty1 ]]; then
    exec startx;
fi

[ -f ~/.fzf.bash ] && source ~/.fzf.bash
