# xdg-desktop-portal-gtk4-printfix-bin

Arch Linux `-bin` package for [xdg-desktop-portal-gtk4](https://github.com/JohnRTitor/xdg-desktop-portal-gtk4),
prebuilt from upstream `master` plus a local patch.

The Print portal fixes this package used to carry as `print-single-call.patch`
are upstream since `3461d7e` ("print: support single-call Print and fix fd
lifetime"), and the page-setup warning fix since `34f8de3` ("preserve typed
values across the a{sv} boundary"). The binary is built from master snapshot
`21036d2` plus `feat/live-user-css` (upstream PR #6), which reloads
`~/.config/gtk-4.0/gtk.css` at runtime so open portal dialogs follow theme
switches instead of waiting for a service restart. Versioned
`1.6.7.r26.g4c4dde2`.

This is a stopgap update: the intended successor is
`xdg-desktop-portal-gtk4-bin`, which is waiting for AUR adoption. The package
can be dropped once that one is available.

## Rebuild the binary

```sh
curl -LO https://github.com/JohnRTitor/xdg-desktop-portal-gtk4/archive/21036d2.tar.gz
tar -xzf 21036d2.tar.gz
cd xdg-desktop-portal-gtk4-21036d2*
git apply /path/to/live-user-css.patch   # feat/live-user-css, upstream PR #6
cargo build --release --locked
strip target/release/xdg-desktop-portal-gtk4
```

Stage the binary together with `gtk4.portal`, the D-Bus service, the systemd
user unit, the desktop file and `LICENSE` (`make install DESTDIR=… PREFIX=/usr
LIBEXECDIR=/usr/lib` produces them), then attach the tarball to a GitLab
release of `xdg-desktop-portal-gtk4-bin`. The `PKGBUILD` downloads that asset.
