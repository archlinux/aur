# AUR Package for go-cli-package

This is the AUR (Arch User Repository) package for [go-cli-package](https://devan.gg/go-cli-package).

The package is named `go-cli-package` but installs the binary as `go-cli-package`.

## Installation

### Using an AUR helper (recommended)

```bash
yay -S go-cli-package
# or
paru -S go-cli-package
```

### Manual installation

```bash
git clone https://aur.archlinux.org/go-cli-package.git
cd go-cli-package
makepkg -si
```

## Usage

After installation, use the `go-cli-package` command:

```bash
go-cli-package --help
```

## Updating

```bash
yay -Syu go-cli-package
# or
paru -Syu go-cli-package
```

## Uninstall

```bash
sudo pacman -R go-cli-package
```

## Maintainer

hi@devan.gg
