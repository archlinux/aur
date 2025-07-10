#!/bin/bash

for rcfile in ~/.bashrc ~/.zshrc; do
  if [ -f "$rcfile" ]; then
    if ! grep -q 'ayaanfetch' "$rcfile"; then
      echo '# >>> AYAAN UNSTABLE ZONE >>>' >> "$rcfile"
      echo 'alias ayaanfetch="wine /usr/bin/unstable/ayaanfetch/AyaanFetch.exe"' >> "$rcfile"
      echo 'export EPATH=/usr/bin/unstable/ayaanfetch' >> "$rcfile"
      echo 'echo \"AYAANFETCH by AYAAN511 (github.com/ayaan511) – WELCOME TO THE UNSTABLE ZONE!\"' >> "$rcfile"
      echo '# <<< AYAAN UNSTABLE ZONE <<<' >> "$rcfile"
      # Auto-source the rcfile for INSTANT ALIAS!
      source "$rcfile"
    fi
  fi
done

