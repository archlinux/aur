#!/bin/bash
# Tamil Assistant Post-Installation Script
# This script sets up user configuration and i3 integration

set -e

echo "🔧 Setting up Tamil Assistant..."

# Detect the actual user (not root during package installation)
if [ "$EUID" -eq 0 ]; then
    # Running as root - this happens during package installation
    # Don't create user-specific files during package installation
    echo "⚠️  Running as root during package installation"
    echo "📋 User configuration will be created on first run"
    echo "ℹ️  Run 'tamil-assistant --setup' after installation to configure for your user"
    echo ""
    echo "📖 Next steps after installation:"
    echo "1. Run: tamil-assistant --setup"
    echo "2. Edit ~/.config/tamil-assistant/config.ini and add your Google Gemini API key"
    echo "3. Add i3 bindings to ~/.config/i3/config (see instructions below)"
    echo "4. Reload i3: i3-msg reload"
    echo "5. Launch Tamil Assistant with Mod+Y"
    echo ""
    echo "📋 i3 Configuration (add to ~/.config/i3/config):"
    echo "# Tamil Assistant"
    echo "bindsym \$mod+y exec tamil-assistant-launcher"
    echo "for_window [class=\"TamilAssistant\"] move scratchpad"
    echo "for_window [class=\"TamilAssistant\"] resize set 400 900"
    echo "for_window [class=\"TamilAssistant\"] floating enable"
    echo "for_window [class=\"TamilAssistant\"] move position 1520 0"
    exit 0
else
    # Running as regular user
    ACTUAL_USER="$USER"
    ACTUAL_HOME="$HOME"
fi

echo "👤 Setting up for user: $ACTUAL_USER"

# Create user config directory
USER_CONFIG_DIR="$ACTUAL_HOME/.config/tamil-assistant"
mkdir -p "$USER_CONFIG_DIR"

# Copy default config if it doesn't exist
if [ ! -f "$USER_CONFIG_DIR/config.ini" ]; then
    echo "📝 Creating user configuration..."
    cp /etc/tamil-assistant/config.ini.example "$USER_CONFIG_DIR/config.ini"
    echo "✅ Configuration created at $USER_CONFIG_DIR/config.ini"
    echo "⚠️  Please edit this file and add your Google Gemini API key!"
    echo "   Get your API key from: https://aistudio.google.com/apikey"
else
    echo "ℹ️  User configuration already exists at $USER_CONFIG_DIR/config.ini"
fi

# Copy prompt templates if they don't exist
USER_PROMPTS_DIR="$USER_CONFIG_DIR/prompts"
if [ ! -d "$USER_PROMPTS_DIR" ]; then
    echo "📝 Creating user prompt templates..."
    mkdir -p "$USER_PROMPTS_DIR"
    cp /usr/share/tamil-assistant/prompts/* "$USER_PROMPTS_DIR/"
    echo "✅ Prompt templates created at $USER_PROMPTS_DIR/"
    echo "ℹ️  You can customize these prompts for your specific needs"
else
    echo "ℹ️  User prompt templates already exist at $USER_PROMPTS_DIR/"
fi

# Create logs directory
USER_LOG_DIR="$ACTUAL_HOME/.local/share/tamil-assistant/logs"
mkdir -p "$USER_LOG_DIR"
echo "📁 Logs directory created at $USER_LOG_DIR"

# Check if i3 config exists
I3_CONFIG="$ACTUAL_HOME/.config/i3/config"
if [ -f "$I3_CONFIG" ]; then
    echo "🔍 Checking i3 configuration..."
    
    # Check if Tamil Assistant bindings already exist
    if grep -q "tamil-assistant" "$I3_CONFIG"; then
        echo "ℹ️  Tamil Assistant bindings already exist in i3 config"
    else
        echo "⚠️  Tamil Assistant bindings not found in i3 config"
        echo "📋 Manual configuration required. Add these lines to your ~/.config/i3/config:"
        echo ""
        echo "# Tamil Assistant"
        echo "bindsym \$mod+y exec tamil-assistant-launcher"
        echo "for_window [class=\"TamilAssistant\"] move scratchpad"
        echo "for_window [class=\"TamilAssistant\"] resize set 400 900"
        echo "for_window [class=\"TamilAssistant\"] floating enable"
        echo "for_window [class=\"TamilAssistant\"] move position 1520 0"
        echo ""
        echo "Then reload i3 with: i3-msg reload"
    fi
else
    echo "⚠️  i3 config not found at $I3_CONFIG"
    echo "📋 Create ~/.config/i3/config and add the Tamil Assistant bindings"
fi

# Update desktop database
if command -v update-desktop-database >/dev/null 2>&1; then
    echo "🔄 Updating desktop database..."
    update-desktop-database "$ACTUAL_HOME/.local/share/applications" 2>/dev/null || true
fi

# Update system desktop database
if command -v update-desktop-database >/dev/null 2>&1; then
    echo "🔄 Updating system desktop database..."
    sudo update-desktop-database /usr/share/applications 2>/dev/null || true
fi

echo ""
echo "🎉 Tamil Assistant setup complete!"
echo ""
echo "📖 Next steps:"
echo "1. Edit $USER_CONFIG_DIR/config.ini and add your Google Gemini API key"
echo "2. Add the i3 bindings to your ~/.config/i3/config (see above)"
echo "3. Reload i3: i3-msg reload"
echo "4. Launch Tamil Assistant with Mod+Y"
echo ""
echo "📚 Documentation: /usr/share/doc/tamil-assistant/README.md"
echo "🔧 Configuration: $USER_CONFIG_DIR/config.ini"
echo "📝 Logs: $USER_LOG_DIR/"
