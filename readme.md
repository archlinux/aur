# Twos AppImage PKGBUILD

## Local Development Setup

To run the version finder script locally:

```bash
# Create virtual environment
python3 -m venv .venv

# Activate virtual environment
source .venv/bin/activate

# Install dependencies
pip install -r requirements.txt

# Install Playwright browser
playwright install chromium

# Run the script
./find_release.sh
```

## Always

Generate .SRCINFO

`makepkg --printsrcinfo > .SRCINFO`

## release package

```bash

makepkg --printsrcinfo > .SRCINFO
git add PKGBUILD .SRCINFO
git commit -m "useful commit message"
git push aur master

```
