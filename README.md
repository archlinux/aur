# AUR Package for aliases

This is the AUR (Arch User Repository) package for [aliases](https://devan.gg/aliases).

The package is named `aliases` but installs the binary as `aliases`.

## Installation

### Using an AUR helper (recommended)

```bash
yay -S aliases
# or
paru -S aliases
```

### Manual installation

```bash
git clone https://aur.archlinux.org/aliases.git
cd aliases
makepkg -si
```

## Usage

After installation, use the `aliases` command:

```bash
aliases --help
```

## Updating

```bash
yay -Syu aliases
# or
paru -Syu aliases
```

## Uninstall

```bash
sudo pacman -R aliases
```

## Maintainer

hi@devan.gg
