#!/bin/bash
# GameChanger Game Profiler

PROFILES_DIR="$HOME/.config/gamechanger/profiles"
mkdir -p "$PROFILES_DIR"

cat > "$PROFILES_DIR/final_fantasy.orp" << "FFEOF"
{"profile":[{"name":"Final Fantasy XIV","colors":[{"name":"Keyboard","color":[255,0,0]},{"name":"Mouse","color":[255,0,0]},{"name":"RAM","color":[255,0,0]},{"name":"GPU","color":[255,0,0]}]}]}
FFEOF

cat > "$PROFILES_DIR/desktop.orp" << "DSEOF"
{"profile":[{"name":"Desktop","colors":[{"name":"Keyboard","color":[0,255,0]},{"name":"Mouse","color":[0,255,0]},{"name":"RAM","color":[0,255,0]},{"name":"GPU","color":[0,255,0]}]}]}
DSEOF

current_profile=""
load_profile() {
    local profile="$1"
    [ "$current_profile" = "$profile" ] && return
    if openrgb --profile "$PROFILES_DIR/$profile" 2>/dev/null; then
        current_profile="$profile"
        notify-send -a "GameChanger" "🎨 RGB" "$profile aktiviert"
    fi
}

echo "🔍 Warte auf OpenRGB..."
until openrgb --version > /dev/null 2>&1; do
    sleep 2
done

while true; do
    if pgrep -f "ffxiv" > /dev/null || pgrep -f "FINAL" > /dev/null; then
        load_profile "final_fantasy.orp"
    else
        load_profile "desktop.orp"
    fi
    sleep 10
done
