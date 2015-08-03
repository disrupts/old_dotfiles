#!/bin/sh

# change locale
export LC_CTYPE="en_GB.UTF-8"

# loading .Xresources
#[[ -f ~/.Xresources ]] && xrdb -merge ~/.Xresources
xrdb -merge ~/.Xresources

# Add fonts
# xset +fp ~/.fonts/*

# set the cursor & default background
xsetroot -cursor_name left_ptr -solid steelblue

# sinaptics driver; commented by now, cause something is wrong and driver is not working
#syndaemon -t -k -i 2 -d &

# start urvt deamon
urxvtd --quiet --opendisplay --fork

# set wallpaper
#  this is no good, it streches the image, despite the --bg-scale flag
feh --bg-fill  ~/.background
#eval $(cat ~/.fehbg) &

# There's something wrong with bgs
#DISPLAY=$HOST:1 bgs ~/.background &

# start redshift
redshift -c ~/.redshift &

# start flexget
#flexget daemon start -d

# start trayer
#trayer --edge top --align right --SetDockType true --SetPartialStrut true --expand true --width 6 --transparent true  --alpha 0  --tint 0x000000  --height 17 &

# start dmenu
#dmenu -i -nb 000 -nf 2222ff &
#exec dmenu

# compositor
# compton -b -GC -e 0.7 --backend glx --blur-background
compton -b -GC -e 0.7 --backend glx \
  --blur-background --blur-kern "5x5box"
  # --blur-background --blur-kern "7x7box"

# Set keyboard and remaps needs to be after feh & compton for xmodmap to work
CURRENT_OS='Linux' ~/.keyboard

# start xmonad
# exec xmonad

# start bspwm
# sxhkd -c ~/.sxhkdrc &
# cat .sxhkd/{basics,bspwm} > /tmp/sxhkdrc && sxhkd -c /tmp/sxhkdrc &
cat ~/.sxhkd/* > /tmp/sxhkdrc && sxhkd -c /tmp/sxhkdrc 2>&1 > /tmp/sxhkd.log &
exec bspwm -c ~/.bspwmrc                               2>&1 > /tmp/bspwm.log
