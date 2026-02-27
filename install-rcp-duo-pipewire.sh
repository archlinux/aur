#!/usr/bin/env bash
# Install PipeWire virtual devices for Rodecaster Duo.
# Outputs: Game, System, Chat, Music (Chat uses pro-output-0; others use pro-output-1).
# Inputs: Main Multitrack, Chat (pro-input-1, pro-input-0).
#
# Set Duo to "Pro Audio" profile first, then run this script.
# Device names are set in the config templates; edit node.description to rename.

set -e

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
# When installed via package, templates live in /usr/share
if [ -f "/usr/share/rodecaster-duo-pipewire/99-rodecaster-duo-virtual-sinks.conf.template" ]; then
  TEMPLATE_DIR="/usr/share/rodecaster-duo-pipewire"
else
  TEMPLATE_DIR="$SCRIPT_DIR"
fi
TEMPLATE="$TEMPLATE_DIR/99-rodecaster-duo-virtual-sinks.conf.template"
TEMPLATE_SOURCES="$TEMPLATE_DIR/99-rodecaster-duo-virtual-sources.conf.template"
CONF_D="$HOME/.config/pipewire/pipewire.conf.d"
CONF_FILE="$CONF_D/99-rodecaster-duo-virtual-sinks.conf"
CONF_FILE_SOURCES="$CONF_D/99-rodecaster-duo-virtual-sources.conf"

if [ "$1" = "--discover-only" ] || [ "$1" = "-d" ]; then
  if [ -x "/usr/bin/rodecaster-duo-pipewire-discover" ]; then
    exec /usr/bin/rodecaster-duo-pipewire-discover
  else
    exec "$SCRIPT_DIR/discover-rcp-devices.sh"
  fi
fi

# Strip surrounding double quotes (pw-cli often returns "node.name" with quotes)
strip_quotes() { echo "$1" | sed -e 's/^"//' -e 's/"$//'; }

# --- Resolve target.object ---
TARGET_OBJECT=""
TARGET_CHAT_OBJECT=""
TARGET_CAPTURE_MAIN=""
TARGET_CAPTURE_CHAT=""
if [ -n "$1" ] && [ "$1" != "--discover-only" ]; then
  TARGET_OBJECT=$(strip_quotes "$1")
  echo "Using target.object (Main): $TARGET_OBJECT"
fi
  if ! command -v pw-cli &>/dev/null; then
    echo "pw-cli not found. Install pipewire-cli."
    exit 1
  fi
  get_id() { echo "$1" | sed -n 's/.*id \([0-9]*\).*/\1/p'; }

  if [ -z "$TARGET_OBJECT" ]; then
    echo "Discovering Rodecaster Duo (Pro Audio profile required)..."
    best_aux_count=0
    while IFS= read -r line; do
    id=$(get_id "$line")
    [ -z "$id" ] && continue
    info=$(pw-cli info "$id" 2>/dev/null) || continue
    media=$(echo "$info" | grep "media.class" | head -1 | cut -d= -f2- | tr -d ' ')
    desc=$(echo "$info" | grep "node.description" | cut -d= -f2- | tr -d ' ')
    name_raw=$(echo "$info" | grep "node.name" | head -1 | cut -d= -f2- | tr -d ' ')
    name=$(strip_quotes "$name_raw")
    pos=$(echo "$info" | grep "audio.position" | head -1 | cut -d= -f2-)
    echo "$media" | grep -qi "sink\|playback" || continue
    echo "$desc" | grep -qi "rode\|rodecaster\|duo" || continue
    echo "$name" | grep -q "^rcp_duo_" && continue
    if ! echo "$name" | grep -q "pro-output\|multichannel"; then
      echo "$pos" | grep -qi "AUX" || continue
    fi
    # Count AUX channels (AUX0..AUX9)
    aux_count=$(echo "$pos" | grep -o "AUX[0-9]" | sort -u | wc -l)
    if [ "${aux_count:-0}" -gt "$best_aux_count" ]; then
      best_aux_count=$aux_count
      TARGET_OBJECT="$name"
    fi
  done < <(pw-cli ls Node 2>/dev/null | grep -E "^\s*id [0-9]+")

    if [ -n "$TARGET_OBJECT" ]; then
      echo "Detected (Main, ${best_aux_count}ch): $TARGET_OBJECT"
    fi
  fi

  # Chat output = Rode playback with fewest channels (pro-output-0)
  chat_aux_count=999
  while IFS= read -r line; do
    id=$(get_id "$line")
    [ -z "$id" ] && continue
    info=$(pw-cli info "$id" 2>/dev/null) || continue
    media=$(echo "$info" | grep "media.class" | head -1 | cut -d= -f2- | tr -d ' ')
    desc=$(echo "$info" | grep "node.description" | cut -d= -f2- | tr -d ' ')
    name_raw=$(echo "$info" | grep "node.name" | head -1 | cut -d= -f2- | tr -d ' ')
    name=$(strip_quotes "$name_raw")
    pos=$(echo "$info" | grep "audio.position" | head -1 | cut -d= -f2-)
    echo "$media" | grep -qi "sink\|playback" || continue
    echo "$desc" | grep -qi "rode\|rodecaster\|duo" || continue
    echo "$name" | grep -q "^rcp_duo_" && continue
    [ "$name" = "$TARGET_OBJECT" ] && continue
    aux_count=$(echo "$pos" | grep -o "AUX[0-9]" | sort -u | wc -l)
    if [ "${aux_count:-0}" -lt "$chat_aux_count" ]; then
      chat_aux_count=$aux_count
      TARGET_CHAT_OBJECT="$name"
    fi
  done < <(pw-cli ls Node 2>/dev/null | grep -E "^\s*id [0-9]+")
  if [ -n "$TARGET_CHAT_OBJECT" ]; then
    echo "Detected (Chat output, ${chat_aux_count}ch): $TARGET_CHAT_OBJECT"
  fi

  # Capture: pro-input-1 = Main, pro-input-0 = Chat
  while IFS= read -r line; do
    id=$(get_id "$line")
    [ -z "$id" ] && continue
    info=$(pw-cli info "$id" 2>/dev/null) || continue
    media=$(echo "$info" | grep "media.class" | head -1 | cut -d= -f2- | tr -d ' ')
    desc=$(echo "$info" | grep "node.description" | cut -d= -f2- | tr -d ' ')
    name_raw=$(echo "$info" | grep "node.name" | head -1 | cut -d= -f2- | tr -d ' ')
    name=$(strip_quotes "$name_raw")
    echo "$media" | grep -qi "source\|capture" || continue
    echo "$desc" | grep -qi "rode\|rodecaster\|duo" || continue
    echo "$name" | grep -q "^rcp_duo_" && continue
    if echo "$name" | grep -q "pro-input-1"; then
      TARGET_CAPTURE_MAIN="$name"
    elif echo "$name" | grep -q "pro-input-0"; then
      TARGET_CAPTURE_CHAT="$name"
    fi
  done < <(pw-cli ls Node 2>/dev/null | grep -E "^\s*id [0-9]+")
  if [ -n "$TARGET_CAPTURE_MAIN" ]; then
    echo "Detected (capture Main): $TARGET_CAPTURE_MAIN"
  fi
  if [ -n "$TARGET_CAPTURE_CHAT" ]; then
    echo "Detected (capture Chat): $TARGET_CAPTURE_CHAT"
  fi

# Require at least Main output
if [ -z "$TARGET_OBJECT" ]; then
  echo ""
  echo "No multichannel Rode device found. Set Duo to 'Pro Audio' profile, then run again."
  echo "  rodecaster-duo-set-pro-audio   # if installed via package"
  echo "  pactl set-card-profile <card-name> pro-audio   # or set card manually"
  exit 1
fi
if [ -z "$TARGET_CHAT_OBJECT" ]; then
  echo "Warning: Chat output device not found; Chat sink may not work."
fi

# --- Install config (TARGET_OBJECT is already unquoted) ---
if [ ! -f "$TEMPLATE" ]; then
  echo "Template not found: $TEMPLATE"
  exit 1
fi

mkdir -p "$CONF_D"
sed -e "s|TARGET_OBJECT|$TARGET_OBJECT|g" -e "s|TARGET_CHAT_OBJECT|${TARGET_CHAT_OBJECT:-$TARGET_OBJECT}|g" "$TEMPLATE" > "$CONF_FILE"
echo "Installed: $CONF_FILE"

if [ -n "$TARGET_CAPTURE_MAIN" ] && [ -n "$TARGET_CAPTURE_CHAT" ] && [ -f "$TEMPLATE_SOURCES" ]; then
  sed -e "s|TARGET_CAPTURE_MAIN|$TARGET_CAPTURE_MAIN|g" -e "s|TARGET_CAPTURE_CHAT|$TARGET_CAPTURE_CHAT|g" "$TEMPLATE_SOURCES" > "$CONF_FILE_SOURCES"
  echo "Installed: $CONF_FILE_SOURCES (virtual inputs)"
else
  rm -f "$CONF_FILE_SOURCES"
fi

echo ""
echo "Restart PipeWire: systemctl --user restart pipewire pipewire-pulse"
echo ""
echo "Outputs: Game, System, Chat, Music."
if [ -n "$TARGET_CAPTURE_MAIN" ] && [ -n "$TARGET_CAPTURE_CHAT" ]; then
  echo "Inputs: Main Multitrack, Chat."
fi