# Mistral Vibe Bin Hardened - Update Automation

## Overview

This document describes the automated update process for the `mistral-vibe-bin-hardened` AUR package.

## Update Strategy

Unlike `antigravity-bin-hardened`, which requires complex distrobox-based version fetching from Debian repositories, **Mistral Vibe has a straightforward update process**:

1. **Source**: GitHub Releases (https://github.com/mistralai/mistral-vibe/releases)
2. **Detection**: GitHub API provides version information directly
3. **Binary**: Direct download from release assets

## Manual Update Process

### 1. Check for New Releases

```bash
# Use GitHub API to check latest version
curl -sL https://api.github.com/repos/mistralai/mistral-vibe/releases/latest | jq -r '.tag_name'
```

### 2. Update PKGBUILD

```bash
# Edit the PKGBUILD
vim PKGBUILD

# Update these fields:
pkgver=1.0.X  # New version
pkgrel=1      # Reset to 1 for new upstream version
```

### 3. Update Checksums

```bash
# Automatically fetch and update checksums
updpkgsums
```

### 4. Regenerate .SRCINFO

```bash
makepkg --printsrcinfo > .SRCINFO
```

### 5. Test Build

```bash
# Clean build
rm -f *.pkg.tar.zst
makepkg -f

# Test installation
sudo pacman -U mistral-vibe-bin-hardened-*.pkg.tar.zst
```

### 6. Commit and Push to AUR

```bash
git add PKGBUILD .SRCINFO
git commit -m "Update to v1.0.X"
git push origin master
```

## Automated Update Script

A fully automated update script can be created:

```bash
#!/usr/bin/env bash
# auto-update-vibe.sh
set -euo pipefail

REPO="mistralai/mistral-vibe"
PKGBUILD_PATH="./PKGBUILD"

# Fetch latest version from GitHub
LATEST_VERSION=$(curl -sL "https://api.github.com/repos/${REPO}/releases/latest" | jq -r '.tag_name' | sed 's/^v//')
CURRENT_VERSION=$(grep '^pkgver=' "$PKGBUILD_PATH" | cut -d'=' -f2)

echo "Current version: $CURRENT_VERSION"
echo "Latest version: $LATEST_VERSION"

if [[ "$LATEST_VERSION" == "$CURRENT_VERSION" ]]; then
    echo "Already up to date"
    exit 0
fi

# Update PKGBUILD
sed -i "s/^pkgver=.*/pkgver=$LATEST_VERSION/" "$PKGBUILD_PATH"
sed -i "s/^pkgrel=.*/pkgrel=1/" "$PKGBUILD_PATH"

# Update checksums
updpkgsums

# Regenerate .SRCINFO
makepkg --printsrcinfo > .SRCINFO

# Test build
makepkg -f

echo "✓ Update to v$LATEST_VERSION completed successfully"
echo "Review changes and then:"
echo "  git add PKGBUILD .SRCINFO"
echo "  git commit -m 'Update to v$LATEST_VERSION'"
echo "  git push"
```

## Version Checking Timer (Optional)

For automated monitoring, you can create a systemd timer similar to `antigravity-update-check.timer`:

```bash
# ~/.config/systemd/user/mistral-vibe-update-check.timer
[Unit]
Description=Check for Mistral Vibe updates weekly

[Timer]
OnCalendar=weekly
Persistent=true

[Install]
WantedBy=timers.target
```

```bash
# ~/.config/systemd/user/mistral-vibe-update-check.service
[Unit]
Description=Check for Mistral Vibe AUR package updates

[Service]
Type=oneshot
ExecStart=/home/markus/zWork/_Git/AUR/PKGSRC/mistral-vibe-bin-hardened/check-version.sh
```

## Comparison to Antigravity Update Process

| Aspect | Antigravity | Mistral Vibe |
|--------|-------------|--------------|
| **Source** | Debian repository (complex) | GitHub Releases (simple) |
| **Version Detection** | Distrobox + apt-cache | GitHub API |
| **Complexity** | High (requires distrobox) | Low (direct API call) |
| **Update Speed** | Slow (container overhead) | Fast (direct download) |
| **Automation Difficulty** | High | Low |

## Future Enhancements

1. **GitHub Actions Integration**: Automatically create PR when new version is detected
2. **AUR Helper Integration**: Integrate with AUR helpers for one-click updates
3. **Notification System**: Email/notify on new releases

---

**Maintainer**: Markus Maiwald <markus@maiwald.work>  
**Last Updated**: 2025-12-10
