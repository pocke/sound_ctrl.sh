#!/bin/sh

amixer sget Master | grep '\[on\]' >/dev/null
# onならば0, offならば1
is_mute=$?

icon_path="$(cd $(dirname $0)&& pwd)"

if [ '0' = ${is_mute} ]; then
  msg="$(amixer sset Master off | grep '\[*\]')"
  icon_path="${icon_path}/mute.png"
else
  msg="$(amixer sset Master on | grep '\[*\]')"
  icon_path="${icon_path}/max.png"
fi
notify-send -i ${icon_path} "volume" "${msg}"
