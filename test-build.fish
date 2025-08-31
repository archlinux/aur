#!/usr/bin/fish --no-config
# Complete build and test script for AUR git package

echo "╔══════════════════════════════════════════════════════════╗"
echo "║                 📄 GENERATING .SRCINFO                   ║"
echo "╚══════════════════════════════════════════════════════════╝"
makepkg --printsrcinfo > .SRCINFO

echo ""
echo "╔══════════════════════════════════════════════════════════╗"
echo "║                 🔨 BUILDING PACKAGE                      ║"
echo "╚══════════════════════════════════════════════════════════╝"
makepkg -fsi

if test $status -eq 0
    echo ""
    echo "╔══════════════════════════════════════════════════════════╗"
    echo "║                 ✅ BUILD SUCCESSFUL                      ║"
    echo "╚══════════════════════════════════════════════════════════╝"
    echo "🧹 Cleaning up build artifacts..."
    rm -rf src/ pkg/ noctalia-shell/ *.pkg.tar.zst
    echo "✨ Cleanup complete!"
else
    echo ""
    echo "╔══════════════════════════════════════════════════════════╗"
    echo "║                 ❌ BUILD FAILED                          ║"
    echo "╚══════════════════════════════════════════════════════════╝"
    echo "🔍 Leaving artifacts for debugging."
end
