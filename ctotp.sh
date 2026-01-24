#!/bin/bash

# Configuration
CONFIG_DIR="$HOME/.config/ctotp"
VAULT_FILE="$CONFIG_DIR/vault.json"
SILENT=false
VERBOSE=false

# Ensure config directory exists
mkdir -p "$CONFIG_DIR"

# Helper: Show usage
usage() {
  echo "Usage: ctotp [COMMAND] [OPTIONS]"
  echo ""
  echo "Commands:"
  echo "  import         Configure the Ente export path and build the vault"
  echo "  copy [NAME]    Copy TOTP code to clipboard (fuzzy search if NAME omitted)"
  echo ""
  echo "Options:"
  echo "  --sync, -y     Run 'ente export' before fetching codes"
  echo "  --silent, -s   Suppress desktop notifications"
  echo "  --verbose, -v  Print logs to console"
  exit 1
}

# Helper: Build JSON Vault from Ente TXT
build_vault() {
  local export_file=$1
  if [[ ! -f "$export_file" ]]; then
    echo "Error: Export file not found at $export_file"
    exit 1
  fi

  echo "[" >"$VAULT_FILE"
  grep "otpauth://" "$export_file" | while read -r line; do
    name=$(echo "$line" | sed -e 's/.*issuer=\([^&]*\).*/\1/')
    secret=$(echo "$line" | sed -e 's/.*secret=\([^&]*\).*/\1/' | tr -d '\r')
    echo "  {\"name\": \"$name\", \"secret\": \"$secret\"}," >>"$VAULT_FILE"
  done
  # Remove last comma and close JSON
  sed -i '$ s/,$//' "$VAULT_FILE"
  echo "]" >>"$VAULT_FILE"
}

# Parse Subcommand
COMMAND=$1
shift

# Parse Flags
while [[ "$#" -gt 0 ]]; do
  case $1 in
  --sync | -y) SYNC=true ;;
  --silent | -s) SILENT=true ;;
  --verbose | -v) VERBOSE=true ;;
  *) NAME=$1 ;; # Assume any non-flag is the Account Name
  esac
  shift
done

if [[ "$VERBOSE" == true ]]; then
  set -x
  # Optional: Customize the prompt for verbose output (makes it stand out)
  export PS4='+ [$(date +"%H:%M:%S")] '
fi

case "$COMMAND" in
import)
  echo "Step 1: Run 'ente account add' if you haven't already."
  echo "Step 2: Run 'ente export' to generate the txt file."
  read -p "Enter full path to ente_auth.txt: " ENTE_PATH
  build_vault "$ENTE_PATH"
  echo "Vault created at $VAULT_FILE"
  ;;

copy)
  if [[ "$SYNC" == true ]]; then
    ente export >/dev/null 2>&1
  fi

  if [[ -z "$NAME" ]]; then
    # Fuzzy search using fzf on the JSON names
    NAME=$(grep '"name":' "$VAULT_FILE" | cut -d '"' -f 4 | fzf --prompt="ctotp > ")
  fi

  if [[ -n "$NAME" ]]; then
    # Extract secret from JSON
    SECRET=$(grep "\"name\": \"$NAME\"" "$VAULT_FILE" | sed -e 's/.*"secret": "\([^"]*\)".*/\1/')

    if [[ -n "$SECRET" ]]; then
      oathtool --totp -b "$SECRET" | wl-copy
      if [[ "$SILENT" == false ]]; then
        notify-send "ctotp" "Code for $NAME copied to clipboard!"
      fi
    else
      echo "Account '$NAME' not found in vault."
    fi
  fi
  ;;
*) usage ;;
esac
