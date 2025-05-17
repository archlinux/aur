# networkmanager-to-iwd

networkmanager-to-iwd a tool for import networks configurations from NetworkManager connections to iwd.

## Installation

### From AUR (Arch User Repository)

```bash
# using an AUR helper like yay:
yay -S networkmanager-to-iwd

# or manually:
git clone https://aur.archlinux.org/networkmanager-to-iwd.git
cd networkmanager-to-iwd
makepkg -si
```

### Manual Installation

```bash
git clone https://github.com/Hanashiko/networkmanager-to-iwd.git
cd networkmanager-to-iwd
sudo install -Dm755 networkmanager-to-iwd.sh /usr/bin/networkmanager-to-iwd
```

## Usage

```bash
# defaul usage - import networks connections from NetworkManager to iwd
sudo networkmanager-to-iwd
```

## License

MIT License
