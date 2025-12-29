# SHIELD System Cleaner

[![License: MIT](https://img.shields.io/badge/License-MIT-blue.svg)](https://opensource.org/licenses/MIT)
[![Shell: Bash](https://img.shields.io/badge/Shell-Bash-green.svg)](https://www.gnu.org/software/bash/)
[![Platform: Arch Linux](https://img.shields.io/badge/Platform-Arch%20Linux-1793D1.svg)](https://archlinux.org/)
[![AUR version](https://img.shields.io/aur/version/shield-cleaner.svg)](https://aur.archlinux.org/packages/shield-cleaner)

Advanced system maintenance tool for Arch Linux with interactive and automated cleaning capabilities.

## Features

- 🧹 **Comprehensive Cleaning**: Pacman cache, AUR cache, journal logs, thumbnails, user cache, temp files, trash, and RAM caches
- 🎨 **Color-coded Output**: Beautiful visual feedback with icons and colors
- 🔧 **Flexible Modes**: Interactive prompts or fully automated operation
- 📊 **Space Tracking**: Shows exactly how much space is freed
- 🔍 **Dry-run Mode**: Preview actions before executing
- 🎯 **Selective Cleanup**: Target specific operations
- 📈 **Summary Reports**: Complete statistics after operation

## Quick Start

```bash
# Install via yay
yay -S shield-cleaner

# Run in interactive mode (prompts for each action)
shield-cleaner

# Run automated cleanup (no prompts)
shield-cleaner -a

# Preview what would be cleaned (dry-run)
shield-cleaner -d
```

## Installation

### Via Yay (Recommended)

```bash
yay -S shield-cleaner
```

### Via AUR

```bash
git clone https://aur.archlinux.org/shield-cleaner.git
cd shield-cleaner
makepkg -si
```

### Manual Installation from Source

```bash
git clone https://github.com/reyanshrajmishra/shield-cleaner.git
cd shield-cleaner
sudo make install
```

### Local User Installation

```bash
git clone https://github.com/reyanshrajmishra/shield-cleaner.git
cd shield-cleaner
make local-install
```
*Note: Ensure `~/.local/bin` is in your PATH*

## Usage

### Interactive Mode (Default)
```bash
shield-cleaner
```

### Automated Mode
```bash
shield-cleaner -a          # Clean everything automatically
shield-cleaner -y          # Auto-yes to all prompts
```

### Dry Run
```bash
shield-cleaner -d          # Preview what would be done
```

### Selective Cleaning
```bash
shield-cleaner --pacman --yay    # Clean package caches only
shield-cleaner --journal 100M    # Vacuum journal to 100MB
shield-cleaner --cache --temp    # Clear cache and temp files
```

### All Options
```bash
shield-cleaner [OPTIONS]

Options:
    -a, --all           Run all cleanups without prompting
    -y, --yes           Automatic yes to prompts
    -d, --dry-run       Show what would be done without doing it
    -v, --verbose       Enable verbose output
    -q, --quiet         Suppress non-essential output
    -h, --help          Show help message
    
    --pacman            Clean pacman cache only
    --yay               Clean yay cache only
    --journal [SIZE]    Vacuum journal logs (default: 50M)
    --thumbnails        Clear thumbnail cache only
    --cache             Clear user cache only
    --temp              Remove temp files only
    --trash             Empty trash only
    --ram               Drop RAM caches only
```

## What Gets Cleaned

| Operation | Description | Requires sudo |
|-----------|-------------|---------------|
| Pacman cache | Removes old/uninstalled package files | Yes |
| Yay cache | Cleans AUR helper cache | Yes |
| Journal logs | Vacuums systemd journal logs | Yes |
| Thumbnails | Removes `~/.cache/thumbnails` | No |
| User cache | Clears `~/.cache` directory | No |
| Temp files | Removes `/tmp` and `/var/tmp` files | Yes |
| Trash | Empties `~/.local/share/Trash` | No |
| RAM cache | Drops kernel page cache | Yes |

## Examples

```bash
# Weekly maintenance routine
shield-cleaner -a

# Check what would be cleaned
shield-cleaner -d -v

# Clean only package caches before system upgrade
shield-cleaner --pacman --yay

# Aggressive journal cleanup
shield-cleaner --journal 25M

# Quick cache cleanup (no sudo needed)
shield-cleaner --thumbnails --cache --trash
```

## Requirements

- **bash** - Shell interpreter
- **pacman** - Package manager
- **util-linux** - For journalctl
- **coreutils** - Core utilities
- **yay** (optional) - AUR helper

## Building from Source

### Prerequisites
Ensure you have `make` and `git` installed on your system.

### Build Commands

```bash
# Clone the repository
git clone https://github.com/reyanshrajmishra/shield-cleaner.git
cd shield-cleaner

# Test the script (dry-run mode)
make test

# Install system-wide (requires sudo)
sudo make install

# Install to custom prefix
sudo make install PREFIX=/usr/local

# Install for current user only
make local-install

# Create an Arch Linux package
makepkg -si

# Uninstall
sudo make uninstall

# Clean build artifacts
make clean
```

### Makefile Targets

| Target | Description |
|--------|-------------|
| `install` | Install to system (default: `/usr/local/bin`) |
| `uninstall` | Remove from system |
| `test` | Run dry-run test with verbose output |
| `local-install` | Install to `~/.local/bin` |
| `clean` | Remove build artifacts |

### Package Structure

```
shield-cleaner/
├── shield-cleaner.sh     # Main executable script
├── Makefile              # Build configuration
├── PKGBUILD              # Arch Linux package specification
├── LICENSE               # MIT License
├── README.md             # Documentation
└── src/                  # Source symlinks for package building
```

## Development

### Testing Changes

```bash
# Run in dry-run mode to test without making changes
./shield-cleaner.sh -d -v

# Test specific features
./shield-cleaner.sh --pacman --dry-run
./shield-cleaner.sh --journal 25M -d
```

### Script Features

- **392 lines** of Bash code
- Color-coded output with icons
- Comprehensive error handling with `set -o pipefail`
- Size calculation and formatting utilities
- Interactive and automated modes
- Dry-run capability for safe testing

## Contributing

Contributions are welcome! Here's how you can help:

1. **Report Bugs**: Open an issue with detailed information
2. **Suggest Features**: Propose new cleaning operations or improvements
3. **Submit Pull Requests**: 
   - Fork the repository
   - Create a feature branch (`git checkout -b feature/amazing-feature`)
   - Test your changes with `make test`
   - Commit your changes (`git commit -m 'Add amazing feature'`)
   - Push to the branch (`git push origin feature/amazing-feature`)
   - Open a Pull Request

### Development Guidelines

- Follow existing code style and formatting
- Test all changes with dry-run mode first
- Update documentation for new features
- Ensure backward compatibility
- Add comments for complex logic

## Changelog

### Version 1.0.0 (Current)
- Initial release with 8 cleaning operations
- Interactive and automated modes
- Dry-run capability
- Color-coded output with progress tracking
- Comprehensive space usage reporting

## License

MIT License

## Author

Created with ❤️ for SHIELD systems

**Project maintained by:** Reyansh Raj Mishra  
**Repository:** https://github.com/reyanshrajmishra/shield-cleaner  
**AUR Package:** https://aur.archlinux.org/packages/shield-cleaner

---

**"You're in control."**
````
