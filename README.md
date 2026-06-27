# so-novel-bin

`so-novel-bin` packages the official Linux x64 and arm64 releases of [So Novel](https://github.com/freeok/so-novel) for Arch Linux.

So Novel is a universal web content extraction and ebook export tool.

## Install

With `paru`:

```bash
paru -S so-novel-bin
```

With `yay`:

```bash
yay -S so-novel-bin
```

Manual install from this repository:

```bash
cd packages/so-novel-bin
makepkg -si
```

## Usage

Start the TUI:

```bash
so-novel
```

Show CLI help:

```bash
so-novel -h
```

Use Web mode:

```bash
SONOVEL_MODE=web so-novel
```

## Notes

- The package installs the upstream bundle under `/opt/sonovel`.
- Runtime configuration is copied to `${XDG_CONFIG_HOME:-~/.config}/sonovel/config.ini` on first launch.
- Rules and downloaded books are stored under `${XDG_DATA_HOME:-~/.local/share}/sonovel`.
- The package provides both `so-novel` and `sonovel` commands.
