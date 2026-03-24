# EasyConfig (cf)

A lightweight CLI tool to quickly open and edit configuration files from the terminal.

**Warning: This project is vibe-coded. Use at your own risk.**

## Features

- **Quick Access**: Open any configured file or directory with a simple command
- **Smart Search**: Automatically search for config files if not found in targets
- **Flexible Editors**: Choose different editors for files vs directories
- **Multiple Config Paths**: Reads from user config, system config, or current directory
- **Interactive Selection**: Optional fzf integration for interactive selection
- **Fast File Search**: Supports fd for faster file searching
- **Config Restoration**: Restore individual settings with `--config restore`

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
sudo install -Dm644 config.ini /etc/easy-config/config.ini
sudo install -Dm444 config.ini /usr/share/easy-config/config.ini.default
```

3. On first run, cf will copy the system config to your user directory:
```bash
~/.config/cf/config.ini
```

## Quick Start

### Basic Usage

```bash
# Edit neovim configuration
cf nvim

# Edit with specific editor
cf fish code

# Edit bash config with nano
cf bash nano

# List all configured targets
cf --list

# View help
cf --help

# View version
cf --version
```

### Configuration

Edit your config file at `~/.config/cf/config.ini`:

```ini
[settings]
default_editor_file=nano          # Editor for files
default_editor_folder=code        # Editor for folders
auto_select_first_found_item=false
config_path=~/.config
use_fzf=true                      # Enable fzf selection
smart_search=true                 # Search if target not found
max_results=20

[targets]
fish=~/.config/fish/config.fish
nvim=~/.config/nvim
zsh=~/.zshrc
# Add more...

[aliases]
neovim=[nvim]
# Map command names to targets
```

### Restore Configuration

```bash
# Restore entire config to defaults
cf --config restore

# Restore specific section
cf --config restore settings
cf --config restore targets
cf --config restore aliases
```

## Configuration Files

- **User Config**: `~/.config/cf/config.ini` (editable)
- **System Config**: `/etc/easy-config/config.ini` (first run copy source)
- **System Defaults**: `/usr/share/easy-config/config.ini.default` (read-only)

On first run, cf automatically creates your user config from the system config.

## Options

```
Options:
  --help                  Show help message
  --version               Show version
  --list                  List all configured targets and aliases
  --config restore        Restore all defaults
  --config restore SECTION
                          Restore settings/targets/aliases section
```

## Examples

### Aliases

Set up command shortcuts in the `[aliases]` section:

```ini
[aliases]
hyprland=[hypr]
dotfiles=[~/.config]
```

Then use them:
```bash
cf hyprland        # Opens [hypr] target
cf dotfiles        # Opens [~/.config] directory
```

### Multiple Editors

```bash
cf nvim            # Uses default_editor_file from config
cf nvim code       # Override with 'code' editor
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
cat ~/.config/cf/config.ini
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