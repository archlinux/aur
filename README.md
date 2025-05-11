# i3map

i3map is a tool for generating a human-readable table of keybindings from your i3wm config file.

## Features

- Parses your i3wm config file to extract all keybindings
- Handles variable definitions in config files
- Can sort bindings by modifier, key, or action
- Shows undefined bindings (those with unresolved variables)

## Installation

### From AUR (Arch User Repository)

```bash
# Using an AUR helper like yay:
yay -S i3map

# Or manually:
git clone https://aur.archlinux.org/i3map.git
cd i3map
makepkg -si
```

### Manual Installation

```bash
git clone https://github.com/hanashiko/i3map.git
cd i3map
sudo install -Dm755 i3map.py /usr/bin/i3map
```

## Usage

```bash
# Default usage - reads from ~/.config/i3/config
i3map

# Specify a custom config file
i3map --config /path/to/config

# Sort by modifier, key, or action
i3map --sort modifier
i3map --sort key
i3map --sort action
```

## Examples

```
Super+Return      → exec terminal
Super+d           → exec dmenu_run
Super+Shift+q     → kill
Super+h           → focus left
```

## License

MIT License
