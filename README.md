# AUR Package for go-cli-template

This is the AUR (Arch User Repository) package for [go-cli-template](https://devan.gg/go-cli-template).

The package is named `go-cli-template` but installs the binary as `go-cli-template`.

## Installation

### Using an AUR helper (recommended)

```bash
yay -S go-cli-template
# or
paru -S go-cli-template
```

### Manual installation

```bash
git clone https://aur.archlinux.org/go-cli-template.git
cd go-cli-template
makepkg -si
```

## Usage

After installation, use the `go-cli-template` command:

```bash
go-cli-template --help
```

## Updating

```bash
yay -Syu go-cli-template
# or
paru -Syu go-cli-template
```

## Uninstall

```bash
sudo pacman -R go-cli-template
```

## Maintainer

hi@devan.gg
