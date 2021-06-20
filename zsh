#!/usr/bin/env zsh

while read line; do
  if [[ "$line" = usr/share/zsh/functions/* || "$line" =  usr/share/zsh/site-functions/* ]]; then
    if [[ -s "$line" && -f "$line" && "${line}" != *".zwc" && ! "${line}.zwc" -nt "${line}" ]]; then
      echo " => /$line"
      zcompile "$line" 2>/dev/null
    fi
  fi
done
