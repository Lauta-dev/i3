#!/bin/bash

icon_play="/usr/share/icons/Fluent-yellow-dark/32/actions/media-playback-start.svg"
icon_pause="/usr/share/icons/Fluent-yellow-dark/32/actions/media-playback-pause.svg"

toggle() {
  status="$(mpc status | grep -o '\[.*\]')"

  local artist_name="$(mpc -f %artist% current)"
  local music_name="$(mpc -f %title% current)"
  local music_duration="$(mpc -f %time% current)"
  
  $(mpc toggle)
  
  if [[ $status == "[playing]" ]]; then
    notify-send "$artist_name :: $music_duration" "$music_name" -i $icon_pause

  elif [[ $status == "[paused]" ]]; then
    notify-send "$artist_name :: $music_duration" "$music_name" -i $icon_play
  fi
}; toggle

