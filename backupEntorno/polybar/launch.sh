#!/usr/bin/env sh

## Add this to your wm startup file.
xrandr --output Virtual1 --primary --mode 1920x1080 --rotate normal
# Terminate already running bar instances
killall -q polybar

## Wait until the processes have been shut down
while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done

## Launch
picom -b

## Left bar
polybar log -c ~/.config/polybar/current.ini &
polybar secondary -c ~/.config/polybar/current.ini &
polybar ethernet -c ~/.config/polybar/current.ini &
polybar hackthebox -c ~/.config/polybar/current.ini &

## Right bar
polybar top -c ~/.config/polybar/current.ini &
polybar primary -c ~/.config/polybar/current.ini &
polybar set_target -c ~/.config/polybar/current.ini &

## Center bar
polybar primary -c ~/.config/polybar/workspace.ini &

xsetroot -cursor_name left_ptr &
