#!/bin/bash
# AUR installer using yay because paru has decided to communicate exclusively in binary

fzf_args=(
  --multi
  --preview 'yay -Si {1} 2>/dev/null'
  --preview-label='alt-p: toggle preview, alt-b/B: toggle PKGBUILD, alt-j/k: scroll, tab: multi-select'
  --preview-label-pos='bottom'
  --preview-window 'down:65%:wrap'
  --bind 'alt-p:toggle-preview'
  --bind 'alt-d:preview-half-page-down,alt-u:preview-half-page-up'
  --bind 'alt-k:preview-up,alt-j:preview-down'
  --bind 'alt-b:change-preview(yay -G {1} 2>/dev/null && cat {1}/PKGBUILD 2>/dev/null)'
  --bind 'alt-B:change-preview(yay -Si {1} 2>/dev/null)'
  --color 'pointer:green,marker:green'
  --header 'AUR Package Installer - Select packages with Tab, Enter to install'
  --prompt 'Package: '
)

if ! command -v yay &>/dev/null; then
  echo "Error: yay not found."
  exit 1
fi

echo "Fetching AUR package list..."
pkg_names=$(yay -Slqa 2>/dev/null | fzf "${fzf_args[@]}")

if [[ -n "$pkg_names" ]]; then
  echo ""
  echo "Installing selected packages..."
  echo ""

  readarray -t packages <<<"$pkg_names"

  yay -S "${packages[@]}"

  if command -v updatedb &>/dev/null; then
    echo ""
    echo "Updating locate database..."
    sudo updatedb
  fi

  echo ""
  echo "✓ Installation complete!"
  echo ""
else
  echo "No packages selected."
fi
