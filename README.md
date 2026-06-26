# devin-marketplace - AUR Package

Enable VS Code Marketplace in Devin Desktop IDE (formerly windsurf-marketplace).

## Description

This package enables the official Visual Studio Code Marketplace in Devin Desktop, allowing you to install extensions directly from the VS Code marketplace instead of being limited to the Open VSX registry.

## Installation

### From AUR

```bash
# Using yay
yay -S devin-marketplace

# Using paru
paru -S devin-marketplace

# Manual installation
git clone https://aur.archlinux.org/devin-marketplace.git
cd devin-marketplace
makepkg -si
```

Upgrading from `windsurf-marketplace`: this package replaces it automatically via pacman's `replaces` mechanism.

## How It Works

This package:
- Installs a pacman hook that runs after Devin Desktop updates
- Patches Devin Desktop's `product.json` to enable the VS Code marketplace
- Automatically re-applies the patch when Devin Desktop is updated

## Verification

To verify the marketplace is enabled:
1. Open Devin Desktop
2. Go to Extensions (Ctrl+Shift+X)
3. Search for any extension — results should come from marketplace.visualstudio.com

## Dependencies

- **devin-desktop**: The Devin Desktop IDE
- **python**: Required for the patching script

## Technical Details

The package uses:
- A pacman hook (`/usr/share/libalpm/hooks/devin-marketplace.hook`)
- A Python script (`/usr/share/devin-marketplace/patch.py`)

The hook automatically runs the patch script whenever Devin Desktop is installed or upgraded.

## Troubleshooting

### Marketplace not showing up
Check if the patch was applied:
```bash
grep -i "marketplace.visualstudio" /usr/share/devin-desktop/resources/app/product.json
```

### Patch not applying after update
Manually run the patch:
```bash
sudo python /usr/share/devin-marketplace/patch.py
```

## Related Packages

- **devin-features**: Unblock additional features in Devin Desktop

## Links

- AUR Package: https://aur.archlinux.org/packages/devin-marketplace
- VS Code Marketplace: https://marketplace.visualstudio.com/vscode
- Devin Desktop: https://devin.ai/desktop

## License

0BSD
