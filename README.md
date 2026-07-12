# AUR Package for go-cli-simple

This is the AUR (Arch User Repository) package for [go-cli-simple](https://devan.gg/go-cli-simple).

The package is named `go-cli-simple` but installs the binary as `go-cli-simple`.

## Installation

### Using an AUR helper (recommended)

```bash
yay -S go-cli-simple
# or
paru -S go-cli-simple
```

### Manual installation

```bash
git clone https://aur.archlinux.org/go-cli-simple.git
cd go-cli-simple
makepkg -si
```

## Usage

After installation, use the `go-cli-simple` command:

```bash
go-cli-simple --help
```

## Updating

```bash
yay -Syu go-cli-simple
# or
paru -Syu go-cli-simple
```

## Uninstall

```bash
sudo pacman -R go-cli-simple
```

## Maintainer

hi@devan.gg
