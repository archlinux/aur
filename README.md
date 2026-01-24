# Stegasoo CLI AUR Package

Lightweight CLI-only package for steganography operations. No web UI or API server.

## Installation

### From AUR (once published)
```bash
yay -S stegasoo-cli-git
# or
paru -S stegasoo-cli-git
```

### Manual build
```bash
git clone https://aur.archlinux.org/stegasoo-cli-git.git
cd stegasoo-cli-git
makepkg -si
```

## What Gets Installed

- `/opt/stegasoo-cli/venv/` - Self-contained Python venv with CLI dependencies only
- `/usr/bin/stegasoo` - CLI executable

## Usage

```bash
# Show all commands
stegasoo --help

# Generate credentials (passphrase + PIN)
stegasoo generate
stegasoo generate --words 5 --pin-length 8

# Generate with RSA keys and QR codes
stegasoo generate --rsa --qr-ascii

# Encode a message
stegasoo encode -i carrier.jpg -r reference.jpg -m "secret message" \
    -P "word1 word2 word3 word4" -p 123456

# Decode a message
stegasoo decode -i encoded.png -r reference.jpg \
    -P "word1 word2 word3 word4" -p 123456

# Image tools
stegasoo tools --help
stegasoo tools compress image.png
stegasoo tools rotate image.jpg 90
```

## For Web UI or REST API

Install the full package instead:
```bash
yay -S stegasoo-git
```

## Maintainer

Aaron D. Lee
