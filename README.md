# tofi-cotp

A simple [tofi](https://github.com/philj56/tofi) wrapper for [cotp](https://github.com/replydev/cotp), providing a clean menu interface for your TOTP codes.

## Features

- 🎨 Clean, sorted alphabetical list of accounts
- 🔐 Secure password storage via gnome-keyring
- 📋 Automatic clipboard copy (Wayland)
- 🔔 Desktop notification with code and expiration time
- 🏷️ Smart display format: shows "Issuer - Label" for clarity
- 🗑️ Secure temp file handling (auto-cleanup)

## Dependencies

- `cotp` - CLI TOTP authenticator
- `tofi` - Application launcher for Wayland
- `libsecret` - Password storage (gnome-keyring)
- `wl-clipboard` - Wayland clipboard utilities
- `zenity` - Password prompt dialog
- `libnotify` (optional) - Desktop notifications

## Installation

### From AUR

```bash
yay -S tofi-cotp
```

### Manual Installation

```bash
git clone https://github.com/bkuri/tofi-cotp.git
cd tofi-cotp
sudo install -Dm755 tofi-cotp /usr/local/bin/tofi-cotp
```

## Setup

### 1. Initialize cotp

First, set up your cotp database:

```bash
cotp
```

This will create your encrypted TOTP database.

### 2. Import existing TOTP codes

From Aegis (or other authenticator apps):

```bash
# Export from Aegis (Settings → Export → Plain text or Encrypted)
cotp import --aegis --path /path/to/aegis-export.json

# Or from other apps:
cotp import --andotp --path /path/to/backup.json
cotp import --google-authenticator --path /path/to/backup.json
```

### 3. Configure keybinding

Add to your window manager config:

#### Niri (`~/.config/niri/config.kdl`)

```kdl
Mod+Alt+T { spawn-sh "tofi-cotp"; }
```

#### Sway/i3 (`~/.config/sway/config`)

```
bindsym $mod+Alt+t exec tofi-cotp
```

#### Hyprland (`~/.config/hypr/hyprland.conf`)

```
bind = $mainMod ALT, T, exec, tofi-cotp
```

## Usage

1. Press your configured hotkey
2. Type to search or scroll through your accounts
3. Select an account
4. TOTP code is copied to clipboard
5. Notification shows the code and remaining time

### First Run

On first run, you'll be prompted to enter your cotp master password. This is stored securely in your system keyring and you won't need to enter it again.

## How It Works

- **Display Format**: Accounts are shown as "Issuer - Label" (e.g., "GitHub - username") for easy identification
- **Sorting**: All accounts are sorted alphabetically
- **Security**: Master password stored in gnome-keyring, temp files cleaned up immediately
- **Clipboard**: Code is copied to both primary and clipboard selections
- **Expiration**: Notification shows remaining seconds until code expires (30s TOTP period)

## Troubleshooting

### "No accounts found"

Make sure you've imported your TOTP codes:
```bash
cotp list
```

### Password prompt keeps appearing

Clear the stored password and re-enter:
```bash
secret-tool clear application cotp
```

### TUI opens instead of tofi

This usually means the password is incorrect. Clear and re-enter:
```bash
secret-tool clear application cotp
```

## Contributing

Contributions welcome! Please open an issue or PR at [github.com/bkuri/tofi-cotp](https://github.com/bkuri/tofi-cotp).

## License

MIT License - see [LICENSE](LICENSE) file for details.

## Credits

- [cotp](https://github.com/replydev/cotp) by replydev
- [tofi](https://github.com/philj56/tofi) by philj56

## See Also

- [cotp Documentation](https://github.com/replydev/cotp)
- [tofi Configuration](https://github.com/philj56/tofi)
