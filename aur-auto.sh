#!/bin/bash

# aur-auto.sh - Modern AUR auto installer
# 🐳 Whale Lab | Script by dev whale

set -euo pipefail

# Cleanup function
cleanup() {
    [[ -n "${TMPDIR:-}" && -d "$TMPDIR" ]] && rm -rf "$TMPDIR"
}
trap cleanup EXIT

# Check prerequisites
for cmd in git curl makepkg pacman jq fzf; do
    if ! command -v "$cmd" &> /dev/null; then
        echo "Error: $cmd is not installed. Please install it first."
        exit 1
    fi
done

# Suggested packages
SUGGESTED=("yay" "paru" "google-chrome" "visual-studio-code-bin")

echo "👉 Type package name(s) or leave blank for suggested defaults."
echo "   You can also search interactively using fuzzy search!"
read -rp "Packages: " -a PACKAGES

# If user input empty, use suggested
if [ ${#PACKAGES[@]} -eq 0 ]; then
    echo "⚡ No input. Using suggested: ${SUGGESTED[*]}"
    PACKAGES=("${SUGGESTED[@]}")
fi

# Detect AUR helper
if command -v yay &>/dev/null; then
    HELPER="yay"
elif command -v paru &>/dev/null; then
    HELPER="paru"
else
    HELPER=""
fi

# Update system
echo "🔄 Updating system..."
sudo pacman -Syu --noconfirm

# Function to search and select package via fzf
search_package() {
    QUERY="$1"
    echo "🔍 Searching AUR for '$QUERY'..."
    RESULTS=$(curl -s "https://aur.archlinux.org/rpc/?v=5&type=search&arg=$QUERY" | jq -r '.results[] | "\(.Name)\t\(.Version)\t\(.Maintainer)\t\(.Description)"')

    if [ -z "$RESULTS" ]; then
        echo "❌ No results for '$QUERY'"
        return 1
    fi

    SELECTED=$(echo "$RESULTS" | fzf --with-nth=1.. --delimiter="\t" --prompt="Select package> " | cut -f1)
    echo "$SELECTED"
}

# Loop through packages
FINAL_LIST=()
for PKG in "${PACKAGES[@]}"; do
    # If exact package installed
    if pacman -Q "$PKG" &>/dev/null; then
        echo "✅ '$PKG' already installed. Skipping."
        continue
    fi

    # Autofill via search if package not exact
    if ! curl -s "https://aur.archlinux.org/rpc/?v=5&type=info&arg[]=$PKG" | jq -e '.results[0]' &>/dev/null; then
        SELECTED=$(search_package "$PKG") || continue
        PKG="$SELECTED"
    fi

    # Fetch details
    INFO=$(curl -s "https://aur.archlinux.org/rpc/?v=5&type=info&arg[]=$PKG")
    NAME=$(echo "$INFO" | jq -r '.results[0].Name')
    VER=$(echo "$INFO" | jq -r '.results[0].Version')
    MAINT=$(echo "$INFO" | jq -r '.results[0].Maintainer')
    DESC=$(echo "$INFO" | jq -r '.results[0].Description')

    echo "📦 Package: $NAME"
    echo "   Version: $VER"
    echo "   Maintainer: $MAINT"
    echo "   Description: $DESC"
    echo

    read -rp "Install '$NAME'? (y/n): " CONFIRM
    if [[ "$CONFIRM" == "y" ]]; then
        FINAL_LIST+=("$NAME")
    else
        echo "Skipping '$NAME'."
    fi
done

# Install all confirmed packages
for PKG in "${FINAL_LIST[@]}"; do
    if [ -n "$HELPER" ]; then
        echo "🚀 Installing '$PKG' with $HELPER..."
        $HELPER -S --noconfirm "$PKG"
    else
        TMPDIR=$(mktemp -d)
        cd "$TMPDIR"

        echo "⬇️ Cloning '$PKG'..."
        git clone "https://aur.archlinux.org/$PKG.git" &>/dev/null
        cd "$PKG" || { echo "Failed to enter dir."; continue; }

        echo "⚙️ Building '$PKG'..."
        makepkg -si --noconfirm
    fi
done

echo
echo "🎉 Done! Installed packages: ${FINAL_LIST[*]}"
echo "🐳 Script by dev whale | Whale Lab"

