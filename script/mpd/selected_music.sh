#!/bin/bash
valor=$1

# Flecha que apunta hacia >>
icon_next="/usr/share/icons/Fluent-yellow-dark/32/actions/media-seek-backward.svg"

# Flecha que apunta hacia <<
icon_prev="/usr/share/icons/Fluent-yellow-dark/32/actions/media-seek-forward.svg"

prev (){
  $(mpc $valor)

  local artist_name="$(mpc -f %artist% current)"
  local music_name="$(mpc -f %title% current)"
  local music_duration="$(mpc -f %time% current)"
 
  if [[ $valor == 'prev' ]]; then
    notify-send "$artist_name :: $music_duration" "$music_name" -i $icon_next

  elif [[ $valor == 'next' ]]; then
    notify-send "$artist_name :: $music_duration" "$music_name" -i $icon_prev
  fi
}; prev

