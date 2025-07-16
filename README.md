# zscaler-deps

AUR package that provides dependencies and compatibility fixes for ZScaler Client Connector on Arch Linux.

## What this package does

- Installs all required dependencies for ZScaler
- Creates compatibility symlinks for Debian/Ubuntu library versions
- Provides post-install instructions

## What this package does NOT do

- Does not install ZScaler itself (requires manual download from your organization)
- Does not configure ZScaler

## Installation

```bash
yay -S zscaler-deps
```

Or build manually:
```bash
git clone https://github.com/apiguy/zscaler-deps.git
cd zscaler-deps
makepkg -si
```

## After Installation

1. Download your organization's ZScaler installer (usually named `Zscaler-linux-X.X.X.X-installer-x64.run`)
2. Run: `sudo bash Zscaler*.run`
3. The services should start automatically

## Troubleshooting

If services fail to start, check logs:
```bash
sudo journalctl -u zstunnel
journalctl --user -u ZSTray
```

## Tested Versions

- ZScaler Client Connector 3.7.2
- Arch Linux (as of January 2025)

## Contributing

Issues and pull requests welcome!

## License

MIT