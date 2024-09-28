#!/bin/sh
/usr/libexec/polkit-kde-authentication-agent-1 &
nm-applet &
pkill -f swayidle
swayidle \
  timeout 5 'qtile cmd-obj -o core -f hide_cursor' resume 'qtile cmd-obj -o core -f unhide_cursor' \
  timeout 300 'swaylock -f -i $wallpaper' \
  timeout 600 'wlopm --off \*' resume 'wlopm --on \*' &
