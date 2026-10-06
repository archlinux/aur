#!/bin/bash
APP_DIR="/opt/fluxer"
CONFIG="/etc/fluxer.conf"

# If there's no config, prompt
if [ ! -s "$CONFIG" ]; then
  DOMAIN=$(zenity --entry \
    --title="Fluxer - Self-Hosted Setup" \
    --text="Insert your desired domain:" \
    --entry-text="chat.mydomain.com")
  if [ -z "$DOMAIN" ]; then
    zenity --error --text="Empty domain."
    exit 1
  fi

  # Always rebuild from source
  cd "$APP_DIR/resources"
  pnpx @electron/asar extract app.asar.original /tmp/fluxer-asar-patch
  find /tmp/fluxer-asar-patch -type f \( -name '*.js' -o -name '*.json' -o -name '*.html' \) \
    -exec sed -i "s/web\.fluxer\.app/${DOMAIN}/g; s/fluxer\.org/${DOMAIN}/g" {} +
  pnpx @electron/asar pack /tmp/fluxer-asar-patch /tmp/fluxer-new.asar
  mv /tmp/fluxer-new.asar app.asar
  rm -rf /tmp/fluxer-asar-patch

  echo "$DOMAIN" | tee "$CONFIG"
  zenity --info --text="Done. Configured domain: $DOMAIN. Remove the content of $CONFIG to start again."
  echo
fi

exec "$APP_DIR/fluxer" "$@"
