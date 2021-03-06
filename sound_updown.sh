#!/bin/sh

# $1 => + or -
function sound_updown()
{
  local icon_path="$(cd $(dirname $0)&& pwd)"
  local msg="$(amixer sset Master 10%$1 | grep '\[*\]')"
  if [ "$(echo ${msg} | grep '\[0%\]' -cE)" = '1' ]; then
    icon_path="${icon_path}/mute.png"
  elif [ "$(echo ${msg} | grep '(\[[1-9]%\])|(\[[1-3].%\])' -cE)" = '1' ]; then
    icon_path="${icon_path}/1.png"
  elif [ "$(echo ${msg} | grep '\[[4-6].%\]' -cE)" = '1' ]; then
    icon_path="${icon_path}/2.png"
  elif [ "$(echo ${msg} | grep '(\[[7-9].%\])|(\[100%\])' -cE)" = '1' ]; then
    icon_path="${icon_path}/max.png"
  fi
  notify-send -i ${icon_path} "volume" "${msg}"
}
