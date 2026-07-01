# claude

Arch Linux PKGBUILD for Anthropic's official Claude Desktop Linux beta `.deb`.

## Build and install

```sh
makepkg -si
```

To build first and install with pacman manually:

```sh
makepkg -s
sudo pacman -U claude-*.pkg.tar.zst
```

## Cowork virtualization support

Claude Desktop's Cowork feature needs QEMU and UEFI firmware. These are hard
dependencies in this PKGBUILD:

- `x86_64`: `qemu-system-x86`, `edk2-ovmf`
- `aarch64`, including Asahi Linux: `qemu-system-aarch64`, `edk2-aarch64`

The upstream app checks Debian/Fedora-style paths for `virtiofsd` and OVMF
firmware. This package adds compatibility symlinks for those paths.

If Claude still reports that virtualization is not fully set up after install,
load the vsock module and restart Claude:

```sh
sudo modprobe vhost_vsock
```

## Updating

```sh
./update-pkgbuild.sh
makepkg --printsrcinfo > .SRCINFO
```

The package downloads upstream artifacts from Anthropic's apt repository and does not redistribute the `.deb`.
