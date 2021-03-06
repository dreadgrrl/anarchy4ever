#!/bin/bash
# Load resources
xrdb -merge .Xresources
 
# Set up an icon tray
trayer --edge top --align right --SetDockType true --SetPartialStrut true \
 --expand true --width 10 --transparent true --alpha 0 --tint 0x333333 --height 17 &
 
# Set the background 
feh --bg-fill /home/allie/Dropbox/backgrounds/crow.jpg

# Fire up apps
dbus-launch thunar --daemon &
wicd-gtk &
pidgin &
skype &
dropboxd &
synergyc allie-arch
xsetroot -cursor_name left_ptr
 
