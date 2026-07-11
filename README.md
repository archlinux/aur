# AUR Package for test-cli

This is the AUR (Arch User Repository) package for [test-cli](https://example.com).

The package is named `test-cli` but installs the binary as `test-cli`.

## Installation

### Using an AUR helper (recommended)

```bash
yay -S test-cli
# or
paru -S test-cli
```

### Manual installation

```bash
git clone https://aur.archlinux.org/test-cli.git
cd test-cli
makepkg -si
```

## Usage

After installation, use the `test-cli` command:

```bash
test-cli --help
```

## Updating

```bash
yay -Syu test-cli
# or
paru -Syu test-cli
```

## Uninstall

```bash
sudo pacman -R test-cli
```

## Maintainer

test@example.com
