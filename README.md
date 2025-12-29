# SHIELD System Cleaner

Advanced system maintenance tool for Arch Linux with interactive and automated cleaning capabilities.

## Features

- 🧹 **Comprehensive Cleaning**: Pacman cache, AUR cache, journal logs, thumbnails, user cache, temp files, trash, and RAM caches
- 🎨 **Color-coded Output**: Beautiful visual feedback with icons and colors
- 🔧 **Flexible Modes**: Interactive prompts or fully automated operation
- 📊 **Space Tracking**: Shows exactly how much space is freed
- 🔍 **Dry-run Mode**: Preview actions before executing
- 🎯 **Selective Cleanup**: Target specific operations
- 📈 **Summary Reports**: Complete statistics after operation

## Installation

### Via Yay (Recommended)

```bash
yay -S shield-cleaner
```

### Manual Installation

```bash
git clone https://aur.archlinux.org/shield-cleaner.git
cd shield-cleaner
makepkg -si
```

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

## License

MIT License

## Author

Created with ❤️ for SHIELD systems

---

**"You're in control, Director."**
