#!/bin/bash
# Helper script to find Antigravity version from Debian package
# This requires installing the Debian package temporarily to inspect it
# Usage: ./debian-version-helper.sh

echo "🔍 Antigravity Debian Package Version Helper"
echo ""
echo "This script helps you find the version and build ID from Google's Debian repo."
echo ""

# Check if we're on a Debian-based system
if ! command -v dpkg &> /dev/null; then
    echo "⚠️  This script requires a Debian-based system (or Docker)"
    echo ""
    echo "Alternative: Use Docker"
    echo "   docker run --rm -it debian:bookworm bash"
    echo "   Then run the setup commands from Google's instructions"
    exit 1
fi

echo "📋 Steps to find version info:"
echo ""
echo "1. Add the Antigravity repository (if not already added):"
echo "   sudo mkdir -p /etc/apt/keyrings"
echo "   curl -fsSL https://us-central1-apt.pkg.dev/doc/repo-signing-key.gpg | \\"
echo "     sudo gpg --dearmor -o /etc/apt/keyrings/antigravity-repo-key.gpg"
echo "   echo 'deb [signed-by=/etc/apt/keyrings/antigravity-repo-key.gpg] https://us-central1-apt.pkg.dev/projects/antigravity-auto-updater-dev/ antigravity-debian main' | \\"
echo "     sudo tee /etc/apt/sources.list.d/antigravity.list > /dev/null"
echo ""
echo "2. Update package cache:"
echo "   sudo apt update"
echo ""
echo "3. Check available version:"
echo "   apt-cache policy antigravity"
echo ""
echo "4. Download (don't install) the package:"
echo "   apt download antigravity"
echo ""
echo "5. Extract and inspect:"
echo "   dpkg-deb -x antigravity_*.deb antigravity-extracted/"
echo "   dpkg-deb -I antigravity_*.deb"
echo ""
echo "6. Find the version file:"
echo "   find antigravity-extracted -name 'version' -o -name 'product.json' | xargs cat"
echo ""
echo "7. The build ID might be in the download URL or package metadata"
echo ""
echo "💡 Automated attempt (requires sudo):"
read -p "Do you want to try this automatically? (y/N) " -n 1 -r
echo
if [[ $REPLY =~ ^[Yy]$ ]]; then
    echo ""
    echo "🔄 Checking Antigravity version from Debian repo..."
    
    # Try to get version info
    if apt-cache policy antigravity &> /dev/null; then
        echo ""
        echo "📦 Package info:"
        apt-cache policy antigravity
        
        echo ""
        echo "📋 Package details:"
        apt-cache show antigravity | grep -E "^(Version|Filename|Description):"
    else
        echo "❌ Antigravity repository not configured"
        echo "   Please follow the manual steps above"
    fi
fi
