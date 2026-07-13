# AUR Package for nator

This is the AUR (Arch User Repository) package for [nator](https://devan.gg/nator).

The package is named `nator` but installs the binary as `nator`.

## Installation

### Using an AUR helper (recommended)

```bash
yay -S nator
# or
paru -S nator
```

### Manual installation

```bash
git clone https://aur.archlinux.org/nator.git
cd nator
makepkg -si
```

## Usage

After installation, use the `nator` command:

```bash
nator --help
```

## Updating

```bash
yay -Syu nator
# or
paru -Syu nator
```

## Uninstall

```bash
sudo pacman -R nator
```

## Maintainer

hi@devan.gg
