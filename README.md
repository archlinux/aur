# Portgeist AUR Package

This repository provides a split AUR build for:
- `portgeist-geistd`: the daemon process
- `portgeist-geistctl`: the CLI controller

## Usage

```sh
makepkg -si
```

Enable the daemon with:

```sh
sudo systemctl enable --now geistd
```
