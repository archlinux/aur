#!/usr/bin/env bash

list=(
  /usr/share/vscodium/resources/app/product.json      # vscodium
  /opt/vscodium-bin/resources/app/product.json        # vscodium-bin
  /usr/share/vscodium-git/resources/app/product.json  # vscodium-git
  /usr/lib/vscodium/product.json                      # vscodium-electron
  /usr/lib/vscodium-electron/product.json             # vscodium-electron-bin
)

for f in "${list[@]}"; do
  if [ -f "$f" ]; then
    echo "[$(basename "$0")] Patching «$f»"
    sed \
      -e 's|"dataFolderName": *"[^"]*"|"dataFolderName": ".local/share/codium"|' \
      -e 's|"sharedDataFolderName": *"[^"]*"|"sharedDataFolderName": ".local/share/codium-shared"|' \
      -i "$f"
  fi
done

# shellcheck disable=SC2016
echo '==> NOTE: Add VSCODE_CLI_DATA_DIR=${XDG_DATA_HOME}/vscodium/cli
          to your environment to avoid creation of ~/.vscode-oss/cli'
