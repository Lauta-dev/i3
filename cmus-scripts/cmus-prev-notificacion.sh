#!/bin/bash
cmus_estado=$(cmus-remote -Q | grep "status"| cut -d " " -f2)

prev() {
  local next=$(cmus-remote -r)
  local cmus_musica=$(cmus-remote -Q | grep "tag title" | cut -d " " -f3-10)
  local cmus_artista=$(cmus-remote -Q | grep "tag artist" | cut -d " " -f3-10)
  
  if [[ $cmus_estado = "playing" ]]; then
    notify-send "CMUS - PREV" "$cmus_artista - $cmus_musica"
  else
    notify-send "Cmus error" "Necesita que cmus este reproduciendo algo"
  fi
}; prev

