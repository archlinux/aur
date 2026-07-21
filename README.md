# AUR Package for timr-cli

This is the AUR (Arch User Repository) package for [timr](https://devan.gg/timr).

The package is named `timr-cli` but installs the binary as `timr`.

## Installation

### Using an AUR helper (recommended)

```bash
yay -S timr-cli
# or
paru -S timr-cli
```

### Manual installation

```bash
git clone https://aur.archlinux.org/timr-cli.git
cd timr-cli
makepkg -si
```

## Usage

After installation, use the `timr` command:

```bash
timr --help
```

## Updating

```bash
yay -Syu timr-cli
# or
paru -Syu timr-cli
```

## Uninstall

```bash
sudo pacman -R timr-cli
```

## Maintainer

hi@devan.gg
