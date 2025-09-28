#!/bin/bash
# Reverts changes made by suscheck package

echo "⚠️ Starting suscheck uninstall..."

# Restore original makepkg
if [[ -f /usr/bin/makepkg.real ]]; then
    echo "🔄 Restoring original /usr/bin/makepkg..."
    sudo mv /usr/bin/makepkg.real /usr/bin/makepkg
fi

# Remove wrapper
if [[ -f /usr/local/bin/makepkg ]]; then
    echo "🗑️ Removing wrapper /usr/local/bin/makepkg..."
    sudo rm -f /usr/local/bin/makepkg
fi

# Remove suscheck script
if [[ -f /usr/local/bin/suscheck.sh ]]; then
    echo "🗑️ Removing /usr/local/bin/suscheck.sh..."
    sudo rm -f /usr/local/bin/suscheck.sh
fi

# Remove supporting files
for f in /usr/local/etc/suscheck-*.txt; do
    [[ -f $f ]] && sudo rm -f "$f" && echo "🗑️ Removed $f"
done

# Remove session temp files
rm -f /tmp/suspcheck_check_decision.* 2>/dev/null

echo "✅ Uninstall complete. Original makepkg restored."
exit 0
