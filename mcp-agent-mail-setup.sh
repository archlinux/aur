#!/bin/sh
# First-time setup: detect coding agents, configure integrations, start server
# This runs the auto-detection script from the installed scripts directory

SCRIPTS_DIR="/usr/share/mcp-agent-mail/scripts"

if [ ! -d "$SCRIPTS_DIR" ]; then
  echo "Error: Scripts directory not found at $SCRIPTS_DIR"
  exit 1
fi

# The auto-detect script needs to run from a directory where it can write .env
# Use XDG config directory
CONFIG_DIR="${XDG_CONFIG_HOME:-$HOME/.config}/mcp-agent-mail"
mkdir -p "$CONFIG_DIR"
cd "$CONFIG_DIR"

exec "$SCRIPTS_DIR/automatically_detect_all_installed_coding_agents_and_install_mcp_agent_mail_in_all.sh" "$@"
