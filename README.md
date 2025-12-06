# kanshi-menu

A simple menu to switch [kanshi](https://sr.ht/~emersion/kanshi/) profiles using fzf, with optional waybar integration.

## Dependencies

- bash
- kanshi
- fzf
- libnotify (for notifications)

## Installation

### Arch Linux (AUR)

```bash
makepkg -si
```

### Manual

```bash
./install.sh
```

Or with custom prefix:

```bash
PREFIX=/usr ./install.sh
```

## Usage

Run `kanshi-menu` to open an fzf prompt with available kanshi profiles. Select one to switch.

### Waybar Integration

Add the content from `waybar.include` to your waybar config's modules section:

```json
"custom/kanshi": {
  "format": "󰍹  {}",
  "tooltip": false,
  "exec": "echo 'kanshi'",
  "on-click": "kanshi-menu",
  "return-type": "string"
}
```

Then add `"custom/kanshi"` to your bar's modules list.

## License

MIT
