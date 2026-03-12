# Lightpanda AUR Package

## Description

This is the Arch Linux AUR package for [Lightpanda](https://lightpanda.io), a headless browser designed for AI and automation.

## Features

- **11x faster** than Chrome
- **9x less memory** than Chrome
- **Instant startup**
- **CDP support** (Chrome DevTools Protocol)
- Compatible with Playwright, Puppeteer, chromedp

## Installation

```bash
# Using yay
yay -S lightpanda

# Using pacman (with AUR helper)
pacman -S lightpanda

# Manual build
git clone https://aur.archlinux.org/lightpanda.git
cd lightpanda
makepkg -si
```

## Usage

```bash
# Start browser on default port 9222
lightpanda

# Start on custom port
lightpanda --port 9223

# Open URL
lightpanda goto https://example.com

# Dump page to markdown
lightpanda fetch --dump markdown https://example.com
```

## Requirements

- glibc
- gcc-libs

## License

AGPL-3.0-only - See [LICENSE](https://github.com/lightpanda-io/browser/blob/main/LICENSE)

## Source

- GitHub: https://github.com/lightpanda-io/browser
- Website: https://lightpanda.io
