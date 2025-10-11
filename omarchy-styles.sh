#!/usr/bin/env bash

API="https://omarchythemes.com/api/themes/all"

# Dependencies check
for tool in gum jq curl chafa; do
  if ! command -v "$tool" >/dev/null; then
    echo "Need to install: $tool"
    exit 1
  fi
done

# Image preview
show_preview() {
  clear
  curl -s "$1" | chafa --size ${FZF_PREVIEW_COLUMNS:-50}x${FZF_PREVIEW_LINES:-30} -
}

SEPARATOR="------------------------------------------"

export -f show_preview

# Installer loop
while true; do
  # Fetch themes and show picker
  theme=$(curl -s "$API" |
    jq -r '.[] | "\(.name)\t\(.url)\t\(.preview_img)"' |
    fzf --delimiter='\t' --with-nth=1 \
      --preview='show_preview {3}' \
      --preview-window='right:50%' \
      --height='100%' \
      --no-border \
      --prompt='> ' \
      --header='Choose theme (103 available) - Enter to install, Esc to quit' \
      --color='prompt:cyan,header:dim')

  # Exit if nothing selected
  [ -z "$theme" ] && break

  # Get theme details
  name=$(echo "$theme" | cut -f1)
  url=$(echo "$theme" | cut -f2)

  # Install it
  clear
  echo "╔════════════════════════════════════════╗"
  echo "║         OMARCHY THEME INSTALLER        ║"
  echo "╚════════════════════════════════════════╝"

  echo "$SEPARATOR"
  printf "          Installing 🛠️ %s...\n" "$name"
  echo "$SEPARATOR"

  if gum spin --title="Please wait" -- omarchy-theme-install "$url"; then
    printf "\n✓ Done!\n\n"
  else
    printf "\n✗ Something went wrong\n\n"
  fi

  # Ask for more
  if ! gum confirm "Install another theme 🎨?"; then
    break
  fi
done

clear
echo "$SEPARATOR"
echo "All done - enjoy your themes! 🎉"
echo "$SEPARATOR"
