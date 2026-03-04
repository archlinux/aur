# AUR Package for bookmark-plus

This is the AUR (Arch User Repository) package for [bookmark](https://devan.gg/bookmark).

The package is named `bookmark-plus` but installs the binary as `bookmark`.

## Installation

### Using an AUR helper (recommended)

```bash
yay -S bookmark-plus
# or
paru -S bookmark-plus
```

### Manual installation

```bash
git clone https://aur.archlinux.org/bookmark-plus.git
cd bookmark-plus
makepkg -si
```

## Usage

After installation, use the `bookmark` command:

```bash
bookmark --help
```

## Updating

```bash
yay -Syu bookmark-plus
# or
paru -Syu bookmark-plus
```

## Uninstall

```bash
sudo pacman -R bookmark-plus
```

## Maintainer

hi@devan.gg
