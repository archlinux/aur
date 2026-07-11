# AUR Package for cli-test

This is the AUR (Arch User Repository) package for [cli-test](https://example.com).

The package is named `cli-test` but installs the binary as `cli-test`.

## Installation

### Using an AUR helper (recommended)

```bash
yay -S cli-test
# or
paru -S cli-test
```

### Manual installation

```bash
git clone https://aur.archlinux.org/cli-test.git
cd cli-test
makepkg -si
```

## Usage

After installation, use the `cli-test` command:

```bash
cli-test --help
```

## Updating

```bash
yay -Syu cli-test
# or
paru -Syu cli-test
```

## Uninstall

```bash
sudo pacman -R cli-test
```

## Maintainer

test@example.com
