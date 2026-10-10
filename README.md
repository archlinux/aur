# linux-sp7

Arch Linux's stock `linux` kernel plus the [linux-surface](https://github.com/linux-surface/linux-surface)
patches a Surface Pro 7 needs:

- `0001-ipts.patch` — IPTS touchscreen/pen support
- `0002-surface-typecover.patch` — Type Cover backlight off in suspend, tablet-mode switch

Install `iptsd` for multi-touch and pen input.

## Building

```sh
git clone https://aur.archlinux.org/linux-sp7.git
cd linux-sp7
gpg --recv-keys ABAF11C65A2970B130ABE3C479BE3E4300411886 \
                647F28654894E3BD457199BE38DBBDC86092693E \
                83BC8889351B5DEBBB68416EB8AC08600F108CDF
makepkg -si
```

Set `_localmodcfg=/path/to/modprobed.db` to build only the modules you use.

## Maintaining

`./update.sh [arch-tag]` syncs `pkgver`, `config.x86_64`, PGP keys and checksums
from Arch's `linux` package and warns if Arch's build functions drifted from
`PKGBUILD`. Afterwards regenerate `.SRCINFO`:

```sh
makepkg --printsrcinfo > .SRCINFO
```

## License

The packaging files in this repository are licensed under [0BSD](LICENSE).
The Linux kernel itself is GPL-2.0-only; the patches keep their upstream licenses.
