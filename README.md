# Meteorman AUR Package

This is the AUR package for Meteorman, a DDP client with GUI for Meteor applications.

## Installation

You can install this package using an AUR helper like `yay` or `paru`:

```bash
yay -S meteorman
```

Or with `paru`:

```bash
paru -S meteorman
```

## Manual Installation

To install manually:

```bash
git clone https://aur.archlinux.org/meteorman.git
cd meteorman
makepkg -si
```

## Building from Source

If you want to build from source:

```bash
git clone https://github.com/harryadel/meteorman.git
cd meteorman
npm install
npm run build
```

## License

This package is released under the MIT license.
