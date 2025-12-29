#!/bin/sh
# Start MCP Agent Mail server with bearer token
# Token is read from ~/.config/mcp-agent-mail/.env or generated

CONFIG_DIR="${XDG_CONFIG_HOME:-$HOME/.config}/mcp-agent-mail"
ENV_FILE="$CONFIG_DIR/.env"

# Ensure config dir exists
mkdir -p "$CONFIG_DIR"

# Load or generate token
if [ -z "${HTTP_BEARER_TOKEN:-}" ]; then
  if [ -f "$ENV_FILE" ]; then
    HTTP_BEARER_TOKEN=$(grep -E '^HTTP_BEARER_TOKEN=' "$ENV_FILE" | sed -E 's/^HTTP_BEARER_TOKEN=//') || true
  fi
fi

if [ -z "${HTTP_BEARER_TOKEN:-}" ]; then
  HTTP_BEARER_TOKEN=$(python -c "import secrets; print(secrets.token_hex(32))")
  echo "HTTP_BEARER_TOKEN=$HTTP_BEARER_TOKEN" >> "$ENV_FILE"
  chmod 600 "$ENV_FILE"
  echo "Generated new bearer token and saved to $ENV_FILE"
fi

export HTTP_BEARER_TOKEN
exec mcp-agent-mail serve-http "$@"
