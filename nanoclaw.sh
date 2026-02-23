#!/bin/bash

TEMPLATE_DIR="/opt/nanoclaw"
USER_WORKSPACE="$HOME/.local/share/nanoclaw"

echo "-------------------------------------------------------"
echo "🚀 NanoClaw personal Claude assistant launcher"
echo "-------------------------------------------------------"

if [ ! -d "$USER_WORKSPACE" ]; then
    echo "📦 Initializing your personal NanoClaw workspace..."
    mkdir -p "$HOME/.local/share"

    cp -r "$TEMPLATE_DIR" "$USER_WORKSPACE"

    chmod -R u+rw "$USER_WORKSPACE"
fi

cd "$USER_WORKSPACE" || { echo "❌ Error: Could not enter workspace"; exit 1; }

echo "✅ Running in: $USER_WORKSPACE"
echo "💡 Tip: Type '/setup' inside Claude to configure your agents."
echo "-------------------------------------------------------"
echo ""

exec claude "$@"
