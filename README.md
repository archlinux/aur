# AUR Package for test-cli-package

This is the AUR (Arch User Repository) package for [test-cli](https://example.com).

The package is named `test-cli-package` but installs the binary as `test-cli`.

## Installation

### Using an AUR helper (recommended)

```bash
yay -S test-cli-package
# or
paru -S test-cli-package
```

### Manual installation

```bash
git clone https://aur.archlinux.org/test-cli-package.git
cd test-cli-package
makepkg -si
```

## Usage

After installation, use the `test-cli` command:

```bash
test-cli --help
```

## Updating

```bash
yay -Syu test-cli-package
# or
paru -Syu test-cli-package
```

## Uninstall

```bash
sudo pacman -R test-cli-package
```

## Maintainer

test-author@example.com
