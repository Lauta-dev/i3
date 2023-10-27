#!/bin/bash

toggle() {
  local cmus_estado=$(cmus-remote -Q | grep "status"| cut -d " " -f2)
  
  if [[ $cmus_estado = "playing" ]]; then
    cmus-remote --pause
    notify-send "CMUS en pausa" 
  elif [[ $cmus_estado = "paused" ]]; then
    cmus-remote --play
    notify-send "CMUS en reproducion" 
  fi
}; toggle

