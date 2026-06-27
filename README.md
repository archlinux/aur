# alexandria-bin

`alexandria-bin` packages the official x86_64 AppImage release of [Alexandria](https://github.com/btpf/Alexandria) for Arch Linux.

Alexandria is a minimalistic ebook reader.

## Install

With `paru`:

```bash
paru -S alexandria-bin
```

With `yay`:

```bash
yay -S alexandria-bin
```

Manual install from this repository:

```bash
cd packages/alexandria-bin
makepkg -si
```

## Launch

Start it from your application menu, or run:

```bash
alexandria
```

## Notes

- The package installs the upstream AppImage under `/opt/alexandria`.
- The package provides the `alexandria` launcher and desktop entry.
