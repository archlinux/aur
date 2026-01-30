# dmenu-xft-emoji

**dmenu** with native color‑font (emoji) rendering and automatic CJK fallback (漢字、かな、カタカナ). Built on top of dmenu 5.2 with a small patch set and a cascading font stack (`Terminus → JetBrains Mono → Noto Sans CJK → Noto Color Emoji`).

## Features

* **Emoji support** via the *allow‑color‑font* patch.
* Seamless fallback for Chinese, Japanese and Korean glyphs.
* Lean, easy‑to‑edit `config.h`.
* Arch Linux package (`PKGBUILD`) that **provides dmenu** and can fully replace the stock build.
* Upstream repo is tagged, making builds reproducible.

## Installation

### AUR (recommended)

```bash
paru -S dmenu-xft-emoji      # or yay / pikaur / aurutils …
```

### Manual build

```bash
git clone https://github.com/limaon/dmenu-xft-emoji.git
cd dmenu-xft-emoji
make
sudo make install           # PREFIX=/usr by default
```

> **Runtime deps**: `libxft`, `libxinerama`, `fontconfig`
> **Suggested fonts**: `terminus-font`, `noto-fonts`, `noto-fonts-cjk`, `noto-fonts-emoji`

## Quick test

```bash
echo -e "Hello 👋\nこんにちは" | dmenu -i
```

If both the emoji and the Kanji render, fallback is working.

## Customisation

Adjust the font cascade in `config.h`:

```c
static const char *fonts[] = {
    "Terminus:size=10:antialias=true:autohint=true",
    "JetBrains Mono:size=10:antialias=true:autohint=true",
    "Noto Sans CJK SC:size=10",
    "Noto Color Emoji:size=10"
};
```

Rebuild:

```bash
make clean install
```

## Syncing to AUR

Since AUR doesn't allow subdirectories (like `.github/`), use this workflow to sync updates:

```bash
# Create clean branch from AUR
git checkout -b aur-branch aur/master

# Copy only AUR-compatible files from master
git checkout master -- PKGBUILD config.h *.diff README.md

# Commit and push to AUR
git commit -m "Update package"
git push aur aur-branch:master

# Clean up
git checkout master
git branch -D aur-branch
```

## Contributing

1. **Fork** and create a topic branch: `git checkout -b feature/name`.
2. Commit in logical chunks with clear English messages.
3. Open a pull request against `main`.
4. Use the issue tracker for questions or bug reports.

## License

Released under the MIT License. See `LICENSE` for details.
