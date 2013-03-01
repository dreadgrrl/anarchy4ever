#!/bin/zsh 
echo 0 | tee -a /sys/class/leds/smc::kbd_backlight/brightness
