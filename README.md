# alexandria-bin

`alexandria-bin` repackages official Linux `.deb` release of
[Alexandria](https://github.com/btpf/Alexandria) for Arch Linux.

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

- package repackages upstream x86_64 `.deb` from the GitHub release page.
- package installs `alexandria` launcher.
