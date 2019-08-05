# Get all X settings
xrdb -merge ~/.Xresources

# Italian Keyboard
setxkbmap -layout it

# Start stuff
~/.fehbg &   # Set bg to previous one
dunst &      # Notification
dwmbar &     # Status bar for dwm
sxhkd &      # Keybinds
clipmenud &  # Clipboard manager
unclutter &  # Hide mouse when idle

# For Seahorse keyring
eval $(/usr/bin/gnome-keyring-daemon --start --components=pkcs11,secrets,ssh)
export SSH_AUTH_SOCK

# Start dwm
while true; do
  dwm 2> /dev/null
done
