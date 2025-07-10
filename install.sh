#!/bin/bash

for rcfile in ~/.bashrc ~/.zshrc; do
  if [ -f "$rcfile" ]; then
    if ! grep -q 'ayaanfetch' "$rcfile"; then
      echo '# >>> AYAAN UNSTABLE ZONE >>>' >> "$rcfile"
      alias ayaanfetch="wine /usr/bin/unstable/ayaanfetch/AyaanFetch.exe 2>/dev/null"
      echo 'export EPATH=/usr/bin/unstable/ayaanfetch' >> "$rcfile"
      echo '# <<< AYAAN UNSTABLE ZONE <<<' >> "$rcfile"
      # Auto-source the rcfile for INSTANT ALIAS!
      source "$rcfile"
    fi
  fi
done

