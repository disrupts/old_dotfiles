#!/bin/sh

# KEYBOARD ############################
# avoids an issue with xkbmap
#setxkbmap -option compose:ralt
# Allow to exit with ctrl-alt-supr
setxkbmap -option terminate:ctrl_alt_bksp
# Swap CTRL & CAPS
setxkbmap -option ctrl:swapcaps
# set spanish keyboard layout
setxkbmap es

# change locale
export LC_CTYPE="en_GB.UTF-8"

# loading .Xresources
#[[ -f ~/.Xresources ]] && xrdb -merge ~/.Xresources
xrdb -merge ~/.Xresources

# set the cursor & default background
xsetroot -cursor_name left_ptr -solid steelblue

# sinaptics driver; commented by now, cause something is wrong and driver is not working
#syndaemon -t -k -i 2 -d &

# start urvt deamon
urxvtd --quiet --opendisplay --fork

# set wallpaper
#  this is no good, it streches the image, despite the --bg-scale flag
#feh --bg-fill  ~/.background 
eval $(cat ~/.fehbg) &

# start redshift
# for version 1.8 and onwards
#redshift &
# need to specify config file for older versions
redshift -c ~/.redshift &

# start flexget
#flexget daemon start -d

# start trayer
trayer --edge top --align right --SetDockType true --SetPartialStrut true --expand true --width 6 --transparent true  --alpha 0  --tint 0x000000  --height 17 &

# start xmonad
#xmonad &
exec xmonad
# start dmenu
#dmenu &
exec dmenu
