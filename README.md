# EasyConfig (cf)

A lightweight CLI tool to quickly open and edit configuration files from the terminal.

**Warning: This project is vibe-coded. Use at your own risk.**

## Features

- **Quick Access**: Open any configured file or directory with a simple command
- **Smart Search**: Automatically search for config files if not found in targets
- **Arbitrary Commands**: Use any command on config files (`cat`, `wc -l`, `rm -rf`, etc.)
- **Flexible Editors**: Choose different editors for files vs directories
- **Multiple Search Paths**: Search across multiple colon-separated config directories
- **Root Awareness**: Automatically searches `/etc/` when running as root
- **Interactive Selection**: Optional fzf integration for interactive selection
- **Fast File Search**: Supports fd for faster file searching
- **Config Restoration**: Restore individual settings with `--config restore`
- **Configurable Cache**: Cache discovered targets for faster lookup

## Installation

### From AUR (Arch Linux)

```bash
yay -S easy-config
# or
paru -S easy-config
```

### Manual Installation

1. Clone the repository:
```bash
git clone https://github.com/keegang6705/EasyConfig
cd EasyConfig
```

2. Install:
```bash
sudo install -Dm755 cf.sh /usr/local/bin/cf
sudo install -Dm755 cf-setup.sh /usr/local/bin/cf-setup
sudo install -Dm644 config.conf /etc/easy-config/config.conf
sudo install -Dm444 config.conf /usr/share/easy-config/config.conf.default
```

3. Run first-time setup:
```bash
cf-setup
```
This copies the system config to your user directory at `~/.config/easy-config/config.conf`.

## Quick Start

### Basic Usage

```bash
# Edit neovim configuration
cf nvim

# Edit with specific editor
cf fish code

# Edit bash config with nano
cf bash nano

# Print kitty config
cf kitty cat

# Count lines in kitty config
cf kitty 'wc -l'

# Delete kitty config (use with caution!)
cf kitty 'rm -rf'

# List all configured targets
cf --list

# View help
cf --help

# View version
cf --version
```

### Configuration

Edit your config file at `~/.config/easy-config/config.conf`:

```ini
[settings]
default_editor_file=nano          # Editor for files
default_editor_folder=code        # Editor for folders
auto_select_first_found_item=false
config_path=~/.config             # Colon-separated search paths
root_config_path=/etc             # Search path when running as root
use_fzf=true                      # Enable fzf selection
smart_search=true                 # Search if target not found
max_results=20

[targets]
fish=~/.config/fish/config.fish
nvim=~/.config/nvim/*
zsh=~/.zshrc
# Add more...

[aliases]
neovim=nvim
# Map command names to targets

[cache]
enabled=true                       # Enable/disable target caching
cache_path=~/.config/easy-config/cache.conf # Cache file location
```

#### Multiple Search Paths

Use colon-separated paths to search across multiple directories:

```ini
config_path=~/.config:~/.local/share:~/dotfiles
```

#### Root Mode

When running as root (`sudo cf`), the tool uses `root_config_path` for smart search:

```ini
root_config_path=/etc
```

### Setup & Migration

```bash
# First-time setup (copies system config to user directory)
cf-setup

# Migrate from old .ini format to .conf
cf-setup --migrate

# Force re-copy from system config
cf-setup --force
```

### Restore Configuration

```bash
# Restore entire config to defaults
cf --config restore

# Restore specific section
cf --config restore settings
cf --config restore targets
cf --config restore aliases
cf --config restore cache
```

## Configuration Files

- **User Config**: `~/.config/easy-config/config.conf` (editable)
- **System Config**: `/etc/easy-config/config.conf` (first run copy source)
- **System Defaults**: `/usr/share/easy-config/config.conf.default` (read-only)

On first run of `cf-setup`, your user config is created from the system config.

## Options

```
Options:
  --help                  Show help message
  --version               Show version
  --list                  List all configured targets and aliases
  --config restore        Restore all defaults
  --config restore SECTION
                          Restore settings/targets/aliases/cache section
```

## Examples

### Aliases

Set up command shortcuts in the `[aliases]` section:

```ini
[aliases]
hyprland=hypr
dotfiles=~/.config
```

Then use them:
```bash
cf hyprland        # Opens [hypr] target
cf dotfiles        # Opens [~/.config] directory
```

### Using Commands

The second argument can be any command, not just editors:

```bash
cf nvim            # Uses default_editor_file from config
cf nvim code       # Override with 'code' editor
cf kitty cat       # Print kitty config to stdout
cf kitty 'wc -l'   # Count lines in kitty config
cf kitty 'head -5' # Show first 5 lines
```

### Smart Search

If a target isn't found, cf can search for it:

```bash
cf some-config     # If not in targets, searches using fd/find
```

## Dependencies

**Required**:
- POSIX shell (sh, bash, zsh, ksh, dash)

**Optional**:
- `fzf` - Interactive selection (enable with `use_fzf=true`)
- `fd` - Faster file searching (automatic fallback to find if not available)

## Troubleshooting

### Config not loading

Check config file exists:
```bash
cat ~/.config/easy-config/config.conf
```

If missing, run setup:
```bash
cf-setup
```

### Migrating from .ini

If you upgraded from an older version that used `.ini` files:
```bash
cf-setup --migrate
```

### Targets not found

Verify target paths exist:
```bash
ls ~/.config/fish/config.fish
```

### Editor not opening

Verify editor is installed and in PATH:
```bash
which nano
which code
```

### Restore defaults

```bash
cf --config restore
```

## License

MIT

## Support

For issues and feature requests, visit: https://github.com/keegang6705/EasyConfig

Author: keegang6705, Claude Haiku 4.5, Claude Opus 4.6