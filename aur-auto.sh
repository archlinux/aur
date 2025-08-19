#!/bin/bash
# aur-auto.sh - Safer AUR installer with fzf search
# 🐳 Whale Lab | by dev whale

set -euo pipefail

PKGDIR="$HOME/pkgbuilds"
YESMODE=false

usage() {
    echo "Usage: aur-auto [options] <package...>"
    echo
    echo "Options:"
    echo "  -y, --yes     Non-interactive mode (no confirmations)"
    echo "  -h, --help    Show this help message"
    echo
    echo "Examples:"
    echo "  aur-auto google-chrome visual-studio-code-bin"
    echo "  aur-auto (then fuzzy search for a package)"
    exit 0
}

# Parse args
ARGS=()
while [[ $# -gt 0 ]]; do
    case "$1" in
        -y|--yes) YESMODE=true ;;
        -h|--help) usage ;;
        *) ARGS+=("$1") ;;
    esac
    shift
done

mkdir -p "$PKGDIR"

# If no package provided → fuzzy search
if [[ ${#ARGS[@]} -eq 0 ]]; then
    echo "🔎 No package specified. Launching AUR search..."
    query=$(fzf --prompt "Search AUR package> " \
                --preview "curl -s 'https://aur.archlinux.org/rpc/?v=5&type=search&arg={}' | jq -r '.results[] | .Name + \" → \" + .Description' | head -n 10" \
                --preview-window=up:10:wrap)

    if [[ -z "$query" ]]; then
        echo "❌ No package selected."
        exit 1
    fi
    pkgname=$(echo "$query" | cut -d' ' -f1)
    ARGS+=("$pkgname")
fi

# Ask before system update
if ! $YESMODE; then
    read -rp "⚡ Update system with pacman -Syu first? [y/N] " ans
    if [[ $ans =~ ^[Yy]$ ]]; then
        sudo pacman -Syu
    fi
fi

# Build & install each package
for pkg in "${ARGS[@]}"; do
    echo "📦 Installing $pkg..."

    cd "$PKGDIR"
    if [[ -d "$pkg" ]]; then
        echo "↻ Updating existing repo..."
        cd "$pkg"
        git pull --quiet || true
    else
        git clone "https://aur.archlinux.org/$pkg.git" || {
            echo "❌ Failed to clone $pkg"
            continue
        }
        cd "$pkg"
    fi

    if ! makepkg -si $($YESMODE && echo "--noconfirm") ; then
        echo "❌ Build failed for $pkg"
        cd - >/dev/null
        continue
    fi

    cd - >/dev/null
    echo "✅ $pkg installed successfully!"
done
