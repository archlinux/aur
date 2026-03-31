# pi-bin

> [!NOTE]
> AI coding agent for the terminal (Arch Linux binary, pi-mono).

- **Multi-architecture**: Native `x86_64` and `aarch64` support.
- **System-integrated**: Installs to `/usr/bin/pi` and `/usr/lib/pi/`.
- **Pre-built**: Includes all runtime assets (WASM and themes).

## Install

```bash
git clone https://github.com/skorotkiewicz/pi-mono-arch.git
makepkg -si
```

## AUR

```bash
yay -S pi-bin
```

## Maintenance

- `just`: Check for updates.
- `just update`: Sync PKGBUILD.
- `just build`: Build local package.
- `just push`: Deploy to GitHub and AUR.

## License

[MIT](https://github.com/badlogic/pi-mono/blob/main/LICENSE)
