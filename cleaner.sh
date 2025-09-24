#!/bin/bash
set -e

echo "Starting GNOME cleanup and Dolphin replacement..."

# 1. Remove GNOME Web (Epiphany) if installed
if pacman -Qs epiphany >/dev/null; then
    echo "Removing GNOME Web..."
    sudo pacman -Rns --noconfirm epiphany
else
    echo "GNOME Web not found."
fi

# 2. Remove GNOME Console if installed
if pacman -Qs gnome-console >/dev/null; then
    echo "Removing GNOME Console..."
    sudo pacman -Rns --noconfirm gnome-console
else
    echo "GNOME Console not found."
fi

# 3. Replace Dolphin executable with a Nautilus wrapper that always opens a new window
if command -v dolphin >/dev/null 2>&1; then
    DOLPHIN_PATH=$(command -v dolphin)
    echo "Found Dolphin at $DOLPHIN_PATH, replacing with Nautilus wrapper..."

    # Backup original Dolphin
    sudo mv "$DOLPHIN_PATH" "${DOLPHIN_PATH}.bak"

    # Create wrapper script
    sudo tee "$DOLPHIN_PATH" >/dev/null <<'EOF'
#!/bin/bash
# Dolphin replacement wrapper using Nautilus, always opening a new window
nohup nautilus --new-window "$@" >/dev/null 2>&1 &
EOF

    # Make wrapper executable
    sudo chmod +x "$DOLPHIN_PATH"
    echo "Dolphin replaced with Nautilus wrapper."
else
    echo "Dolphin not found."
fi

# 4. Remove .desktop entries for Web, Console, and Dolphin
DESKTOP_DIRS=(
    "/usr/share/applications"
    "$HOME/.local/share/applications"
)

for dir in "${DESKTOP_DIRS[@]}"; do
    echo "Cleaning desktop entries in $dir..."
    sudo find "$dir" -type f \( -iname '*epiphany*.desktop' -o -iname '*gnome-console*.desktop' -o -iname '*dolphin*.desktop' \) -exec rm -f {} \;
done

echo "Cleanup finished!"
