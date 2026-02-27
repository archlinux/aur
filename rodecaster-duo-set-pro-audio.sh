#!/usr/bin/env bash
# Set Rodecaster Duo (and similar Rode Pro devices) to Pro Audio profile.
# Auto-detects the ALSA card by name
# Run once after connecting the Duo, or from post-install.

set -e

if ! command -v pactl &>/dev/null; then
  echo "pactl not found. Install pipewire-pulse or pulseaudio."
  exit 1
fi

PROFILE="${1:-pro-audio}"
CARD=""

while IFS= read -r line; do
  # pactl list cards short: index name driver
  name=$(echo "$line" | awk '{print $2}')
  if echo "$name" | grep -qi "rodecaster\|rode.*duo\|usb-R.*DE.*Rode"; then
    CARD="$name"
    break
  fi
done < <(pactl list cards short 2>/dev/null)

if [ -z "$CARD" ]; then
  echo "No Rodecaster Duo (or Rode Pro) card found."
  echo "Connect the device and run: pactl list cards short"
  exit 1
fi

# Try to set profile; on failure list card and profiles
if ! pactl set-card-profile "$CARD" "$PROFILE" 2>/dev/null; then
  echo "Failed to set profile. Card: $CARD"
  echo "Available profiles:"
  pactl list cards 2>/dev/null | sed -n "/Name: $CARD/,/^$/p" | sed -n "/Profiles:/,/Active Profile/p" || true
  exit 1
fi
echo "Set $CARD to profile: $PROFILE"