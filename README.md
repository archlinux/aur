# archforge-git

AI-powered TUI for PKGBUILD generation and AUR management.

## Description

ArchForge is a terminal user interface for generating PKGBUILD files from natural language descriptions and managing Arch User Repository packages.

### Features

- **Natural Language Generation**: Describe what you want in plain English, get a PKGBUILD
- **Interactive TUI**: Vim-like keybindings for efficient package management
- **AUR Integration**: Search, install, and manage AUR packages
- **Deployment**: Deploy to AUR, Docker, Flatpak, or Nix

## Installation

### From AUR (recommended)

```bash
# Using yay
yay -S archforge-git

# Using paru
paru -S archforge-git
```

### From source

```bash
git clone https://github.com/archforge/archforge.git
cd archforge
cargo install --path .
```

## Usage

### Generate PKGBUILD from natural language

```bash
archforge "simple hello world program in C"
archforge "firefox with vaapi support"
archforge "neovim with python and lua plugins"
```

### Interactive TUI

```bash
archforge interactive
```

Or simply:

```bash
archforge
```

### Search AUR

```bash
archforge search neovim
archforge search firefox
```

### Build packages

```bash
archforge build PKGBUILD
archforge build --nodeps PKGBUILD
```

### Deploy to various targets

```bash
archforge deploy aur           # Deploy to AUR
archforge deploy docker        # Build Docker image
archforge deploy flatpak       # Build Flatpak bundle
archforge deploy nix           # Generate Nix flake
```

## TUI Keybindings

| Key | Action |
|-----|--------|
| `h` / `j` / `k` / `l` | Navigate |
| `i` | Insert mode |
| `:` | Command mode |
| `/` | Search |
| `?` | Help |
| `q` | Quit |

## Configuration

Config file: `~/.config/archforge/config.toml`

```toml
[general]
verbose = false
cache_dir = "~/.cache/archforge"

[build]
makepkg_flags = ["--noconfirm", "--needed"]
parallel_jobs = 4

[aur]
rpc_url = "https://aur.archlinux.org/rpc"
```

## Requirements

- Rust 1.75+
- cargo
- git
- makepkg (for building)
- paru or yay (optional, for AUR helper features)

## License

MIT License

## Contributing

Issues and pull requests are welcome at:
https://github.com/archforge/archforge