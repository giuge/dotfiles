# Get all X settings
xrdb -merge ~/.Xresources

# Italian Keyboard
setxkbmap it

# Swap Caps Lock with Ctrl
setxkbmap -layout "$(setxkbmap -print | awk -F + '/xkb_symbols/ {print $2}')" -option ctrl:nocaps

# Start stuff
~/.fehbg &   # Set bg to previous one
dunst &      # Notification
sxhkd &      # Keybinds
clipmenud &  # Clipboard manager
unclutter &  # Hide mouse when idle
[ ! -s ~/.config/mpd/pid ] && mpd

# For Seahorse keyring
eval $(/usr/bin/gnome-keyring-daemon --start --components=pkcs11,secrets,ssh)
export SSH_AUTH_SOCK

# Start dwm
#while true; do
#  dwm 2> /dev/null
#done
exec bspwm
