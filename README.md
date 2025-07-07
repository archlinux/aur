# Thincast Remote Desktop Client

A free Remote Desktop Protocol (RDP) client for Linux, based on FreeRDP.

## Installation

### Using an AUR Helper
```bash
yay -S thincast-client
# or
paru -S thincast-client
```

### Manual Installation
```bash
# Install dependencies
sudo pacman -S --needed base-devel git

# Clone the AUR repository
git clone https://aur.archlinux.org/thincast-client.git
cd thincast-client

# Build and install the package
makepkg -si
```

## Running

You can start Thincast Remote Desktop Client by:

- Using the application menu (search for "Thincast" or "Remote Desktop")
- Running `thincast-client` or `rdc` in the terminal

## Features

- Connect to Remote Desktop Protocol (RDP) servers
- Support for various RDP features
- Modern and user-friendly interface
- Hardware-accelerated video decoding

## Dependencies

- qt5-base
- qt5-svg
- qt5-webengine
- qt5-multimedia
- qt5-graphicaleffects
- qt5-quickcontrols2
- qt5-x11extras
- libx11
- libxcb
- libxkbcommon-x11
- krb5
- pcsclite
- openssl
- zlib
- libsecret
- libusb
- freerdp

## Optional Dependencies

- pulseaudio: Audio support
- libpulse: PulseAudio support
- libxtst: X11 testing - record extension

## Troubleshooting

If the application icon doesn't appear in the menu, try:
```bash
update-desktop-database
gtk-update-icon-cache /usr/share/icons/hicolor
```

## License

Proprietary - See [Thincast's website](https://thincast.com/en/products/client) for more information.

## Links

- [Official Website](https://thincast.com/en/products/client)
- [AUR Package](https://aur.archlinux.org/packages/thincast-client)
