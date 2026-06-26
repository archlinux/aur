# devin-features - AUR Package

Unblock additional features in Devin Desktop IDE (formerly windsurf-features).

## Description

This package enables additional features in Devin Desktop that are normally restricted or disabled, including:
- Settings Sync
- Remote development features
- Additional VS Code functionality

## Installation

### From AUR

```bash
# Using yay
yay -S devin-features

# Using paru
paru -S devin-features

# Manual installation
git clone https://aur.archlinux.org/devin-features.git
cd devin-features
makepkg -si
```

Upgrading from `windsurf-features`: this package replaces it automatically via pacman's `replaces` mechanism.

## How It Works

This package:
- Installs a pacman hook that runs after Devin Desktop updates
- Patches Devin Desktop's `product.json` to enable additional features
- Automatically re-applies the patch when Devin Desktop is updated

## Features Enabled

- **Settings Sync**: Synchronize settings, keybindings, extensions, and snippets across devices
- **Remote Development**: Enhanced remote development capabilities
- **Additional VS Code Features**: Various features that are part of VS Code but restricted in Devin Desktop

## Dependencies

### Required
- **devin-desktop**: The Devin Desktop IDE
- **python**: Required for the patching script
- **python-requests**: For network operations

### Optional
- **org.freedesktop.secrets**: Required for Settings Sync feature (GNOME Keyring, KWallet, etc.)

## Technical Details

The package uses:
- A pacman hook (`/usr/share/libalpm/hooks/devin-features.hook`)
- A Python script (`/usr/share/devin-features/patch.py`)
- A configuration file (`/usr/share/devin-features/patch.json`)

The hook automatically runs the patch script whenever Devin Desktop is installed or upgraded.

## Troubleshooting

### Patch not applying after update
Manually run the patch:
```bash
sudo python /usr/share/devin-features/patch.py devin-features patch
```

## Related Packages

- **devin-marketplace**: Enable VS Code Marketplace in Devin Desktop

## Links

- AUR Package: https://aur.archlinux.org/packages/devin-features
- Devin Desktop: https://devin.ai/desktop

## License

0BSD
