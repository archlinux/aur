#!/usr/bin/env bash
# Discover Rodecaster Duo (and other Rode multichannel) PipeWire/ALSA nodes.
# Run this with the device connected. For virtual sinks you need the
# MULTICHANNEL device (Pro Audio profile), not the stereo IEC958/analog one.
# Usage: ./discover-rcp-devices.sh

set -e

echo "=== PipeWire discovery for Rodecaster Duo (Rode multichannel) ==="
echo ""

if ! command -v pw-cli &>/dev/null; then
  echo "pw-cli not found. Install pipewire-cli (or pipewire)."
  exit 1
fi

# Extract node id from "id 29, type ..." line
get_id() { echo "$1" | sed -n 's/.*id \([0-9]*\).*/\1/p'; }

# Strip surrounding double quotes
strip_quotes() { echo "$1" | sed -e 's/^"//' -e 's/"$//'; }

echo "--- All playback nodes (node.name + node.description) ---"
while IFS= read -r line; do
  id=$(get_id "$line")
  [ -z "$id" ] && continue
  info=$(pw-cli info "$id" 2>/dev/null) || continue
  media=$(echo "$info" | grep "media.class" | head -1 | cut -d= -f2- | tr -d ' ')
  echo "$media" | grep -qi "sink\|playback" || continue
  name=$(echo "$info" | grep "node.name" | head -1 | cut -d= -f2- | tr -d ' ')
  name=$(strip_quotes "$name")
  desc=$(echo "$info" | grep "node.description" | cut -d= -f2- | tr -d ' ')
  pos=$(echo "$info" | grep "audio.position" | head -1 | cut -d= -f2- | tr -d ' ')
  echo "  node.name = $name"
  echo "    description = $desc"
  echo "    audio.position = $pos"
  echo ""
done < <(pw-cli ls Node 2>/dev/null | grep -E "^\s*id [0-9]+")

echo "--- Rode / Rodecaster / Duo devices (playback = sinks) ---"
MULTICHANNEL_FOUND=""
while IFS= read -r line; do
  id=$(get_id "$line")
  [ -z "$id" ] && continue
  info=$(pw-cli info "$id" 2>/dev/null) || continue
  media=$(echo "$info" | grep "media.class" | head -1 | cut -d= -f2- | tr -d ' ')
  desc=$(echo "$info" | grep "node.description" | cut -d= -f2- | tr -d ' ')
  name=$(echo "$info" | grep "node.name" | head -1 | cut -d= -f2- | tr -d ' ')
  name=$(strip_quotes "$name")
  echo "$media" | grep -qi "sink\|playback" && echo "$desc" | grep -qi "rode\|rodecaster\|duo" || continue
  echo "$name" | grep -q "^rcp_duo_" && continue
  pos=$(echo "$info" | grep "audio.position" | head -1 | cut -d= -f2-)
  is_multichannel=""
  if echo "$name" | grep -q "pro-output\|multichannel"; then
    is_multichannel="  *** MULTICHANNEL (use this for virtual sinks) ***"
    MULTICHANNEL_FOUND=1
  elif echo "$pos" | grep -qi "AUX"; then
    is_multichannel="  *** MULTICHANNEL (use this for virtual sinks) ***"
    MULTICHANNEL_FOUND=1
  else
    is_multichannel="  (stereo only - not suitable for System/Game/Music/Chat sinks)"
  fi
  echo "  target.object = \"$name\""
  echo "  (description: $desc)"
  echo "  audio.position: $pos"
  echo "$is_multichannel"
  echo ""
done < <(pw-cli ls Node 2>/dev/null | grep -E "^\s*id [0-9]+")

echo "--- Rode / Rodecaster / Duo devices (capture = sources / inputs) ---"
while IFS= read -r line; do
  id=$(get_id "$line")
  [ -z "$id" ] && continue
  info=$(pw-cli info "$id" 2>/dev/null) || continue
  media=$(echo "$info" | grep "media.class" | head -1 | cut -d= -f2- | tr -d ' ')
  desc=$(echo "$info" | grep "node.description" | cut -d= -f2- | tr -d ' ')
  echo "$media" | grep -qi "source\|capture" && echo "$desc" | grep -qi "rode\|rodecaster\|duo" || continue
  name=$(echo "$info" | grep "node.name" | head -1 | cut -d= -f2- | tr -d ' ')
  name=$(strip_quotes "$name")
  echo "$name" | grep -q "^rcp_duo_" && continue
  pos=$(echo "$info" | grep "audio.position" | head -1 | cut -d= -f2-)
  is_multi=""
  if echo "$pos" | grep -qi "AUX"; then
    is_multi="  *** MULTICHANNEL (use for virtual inputs) ***"
    MULTICHANNEL_FOUND=1
  fi
  echo "  target.object = \"$name\""
  echo "  (description: $desc)"
  echo "  audio.position: $pos"
  echo "$is_multi"
  echo ""
done < <(pw-cli ls Node 2>/dev/null | grep -E "^\s*id [0-9]+")

if [ -z "$MULTICHANNEL_FOUND" ]; then
  echo ">>> No multichannel Rode device found. To get System/Game/Music/Chat virtual sinks:"
  echo "    1. Switch RODECaster Duo to 'Pro Audio' profile:"
  echo "       rodecaster-duo-set-pro-audio   # if installed via package"
  echo "       (or in Plasma: Settings → Audio → select the Duo → Profile: Pro Audio)"
  echo "    2. Run this script again to see the multichannel node (pro-output)."
  echo ""
fi

echo "Channel map (multichannel device): AUX0/1=System(Main), AUX2/3=Game, AUX4/5=Music, AUX6/7=Chat."