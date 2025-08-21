#!/usr/bin/env bash
set -euo pipefail

# -----------------------------
# Minimal bootstrap for Arch
# -----------------------------

# Ensure sudo exists
if ! command -v sudo &>/dev/null; then
  echo ">>> Installing sudo..."
  pacman -Sy --noconfirm sudo
fi

# Update system first
echo ">>> Updating system..."
sudo pacman -Syyu --noconfirm

# Ensure base-devel is installed
echo ">>> Installing base-devel..."
sudo pacman -S --needed --noconfirm base-devel git

# Install yay (AUR helper)
if ! command -v yay &>/dev/null; then
  echo ">>> Installing yay..."
  tmpdir=$(mktemp -d)
  git clone https://aur.archlinux.org/yay.git "$tmpdir/yay"
  pushd "$tmpdir/yay"
  makepkg -si --noconfirm
  popd
  rm -rf "$tmpdir"
fi

# Update AUR packages too
echo ">>> Updating AUR packages..."
yay -Syyu --noconfirm

# -----------------------------
# Dotfiles setup
# -----------------------------
DOTFILES_REPO="https://github.com/yuishigam1/archDots.git"
DOTFILES_DIR="$HOME/.archDots"

echo ">>> Preparing dotfiles at $DOTFILES_DIR"
if [ -d "$DOTFILES_DIR/.git" ]; then
  echo ">>> Updating existing clone..."
  git -C "$DOTFILES_DIR" pull --ff-only
else
  rm -rf "$DOTFILES_DIR"
  git clone "$DOTFILES_REPO" "$DOTFILES_DIR"
fi

echo ">>> Handing off to archDots/install.sh"
exec bash "$DOTFILES_DIR/install.sh"
