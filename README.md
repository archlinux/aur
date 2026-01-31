# rmpd-git

Arch Linux package for rmpd - a modern MPD (Music Player Daemon) implementation written in Rust.

## Installation

### From source (AUR)

```bash
git clone https://github.com/M0Rf30/rmpd-git.git
cd rmpd-git
makepkg -si
```

### Using an AUR helper

```bash
yay -S rmpd-git
# or
paru -S rmpd-git
```

## Configuration

After installation, copy the example configuration:

```bash
mkdir -p ~/.config/rmpd
cp /etc/rmpd/rmpd.toml.example ~/.config/rmpd/rmpd.toml
```

Edit `~/.config/rmpd/rmpd.toml` and configure:
- `music_directory` - Path to your music library
- `bind_address` and `port` - Network settings (default: 127.0.0.1:6600)
- Audio output settings

## Running

### Manual start

```bash
rmpd
```

### Using systemd (user service)

```bash
# Enable and start the service
systemctl --user enable --now rmpd.service

# Check status
systemctl --user status rmpd.service

# View logs
journalctl --user -u rmpd.service -f
```

## Usage

Connect with any MPD client:

```bash
# Using mpc
mpc update
mpc add /
mpc play

# Using ncmpcpp
ncmpcpp
```

## Features

- **MPD Protocol Compatible** - Works with existing MPD clients
- **High-Resolution Audio** - DSD (DSF, DFF), FLAC, WAV support
- **Multi-Room Audio** - Snapcast integration
- **Modern Architecture** - Written in Rust for performance and safety
- **Extensible** - Plugin system for decoders and outputs

## Dependencies

### Required
- `alsa-lib` - ALSA audio output

### Optional
- `pulseaudio` - PulseAudio output support
- `pipewire` - PipeWire output support
- `snapcast` - Multi-room audio synchronization

## Troubleshooting

### Check service status
```bash
systemctl --user status rmpd.service
journalctl --user -u rmpd.service
```

### Test configuration
```bash
rmpd --config ~/.config/rmpd/rmpd.toml
```

### Permission issues
Make sure the rmpd service has read access to your music directory:
```bash
chmod +r ~/Music -R
```

## Links

- **Repository**: https://github.com/M0Rf30/rmpd
- **AUR Package**: https://aur.archlinux.org/packages/rmpd-git
- **MPD Protocol**: https://mpd.readthedocs.io/en/latest/protocol.html

## Maintainer

robertfoster <robertfoster at fastmail dot com>

## License

Dual licensed under MIT OR Apache-2.0
