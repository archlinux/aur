# Trae IDE AUR Package

AUR package for Trae IDE - AI-powered IDE by ByteDance.

## Installation

```bash
yay -S trae-bin
```

## Manual Update

To check for and apply updates:

```bash
cd ~/Documents/trae-linux/aur/trae-bin-git
./tools/check-update.sh --download  # Download and update files
./tools/check-update.sh --auto       # Auto update and push to AUR
```

## Automatic Update Checking

### Option 1: Systemd Timer (Daily Check)

Install the systemd timer to get desktop notifications:

```bash
# Copy service files to systemd directory
mkdir -p ~/.config/systemd/user
cp ~/Documents/trae-linux/aur/trae-bin-git/tools/trae-check.{service,timer} ~/.config/systemd/user/

# Enable and start the timer
systemctl --user enable --now trae-check.timer
```

### Option 2: Cron Job

Add to your crontab:

```bash
crontab -e
```

Add this line to check daily at 9 AM:

```
0 9 * * * ~/Documents/trae-linux/aur/trae-bin-git/tools/notify-update.sh
```

### Option 3: GitHub Actions (Automatic PR)

If you want fully automatic updates via GitHub Actions, fork this repository on GitHub and add the following workflow:

`.github/workflows/update-check.yml`:

```yaml
name: Check for Trae Updates

on:
  schedule:
    - cron: '0 0 * * *'  # Daily at midnight
  workflow_dispatch:  # Manual trigger

jobs:
  check-update:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v4
      
      - name: Check for new version
        id: check
        run: |
          CURRENT=$(grep "^pkgver=" PKGBUILD | cut -d'=' -f2)
          LATEST=$(curl -s -X POST "https://www.trae.ai/api/desktop-api/v1/desktop-upgrade/check" \
            -H "Content-Type: application/json" \
            -d '{"version":"","platform":"linux"}' | \
            grep -o '"version":"[^"]*"' | head -1 | cut -d'"' -f4)
          
          echo "current=$CURRENT" >> $GITHUB_OUTPUT
          echo "latest=$LATEST" >> $GITHUB_OUTPUT
          
          if [ "$CURRENT" != "$LATEST" ]; then
            echo "update_available=true" >> $GITHUB_OUTPUT
          else
            echo "update_available=false" >> $GITHUB_OUTPUT
          fi
      
      - name: Create issue for new version
        if: steps.check.outputs.update_available == 'true'
        run: |
          gh issue create \
            --title "Update to Trae ${atensteps.check.outputs.latest}" \
            --body "New version available: ${atensteps.check.outputs.latest}\n\nCurrent version: ${atensteps.check.outputs.current}\n\nPlease update the PKGBUILD." \
            --label "update"
        env:
          GH_TOKEN: ${atensecrets.GITHUB_TOKEN}}
```

## Files

- `PKGBUILD` - Package build script
- `.SRCINFO` - Source information for AUR
- `trae-bin.install` - Post-install script
- `tools/` - Automation scripts
  - `check-update.sh` - Check and update to new version
  - `notify-update.sh` - Desktop notification script
  - `trae-check.service` - Systemd service
  - `trae-check.timer` - Systemd timer

## Links

- AUR: https://aur.archlinux.org/packages/trae-bin
- Homepage: https://trae.ai