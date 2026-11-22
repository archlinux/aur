# xdg-desktop-portal-gtk4-printfix-bin

Arch Linux `-bin` package for [xdg-desktop-portal-gtk4](https://github.com/JohnRTitor/xdg-desktop-portal-gtk4),
prebuilt from upstream `master`.

The Print portal fixes this package used to carry as `print-single-call.patch`
are upstream since `3461d7e` ("print: support single-call Print and fix fd
lifetime"), and the page-setup warning fix since `34f8de3` ("preserve typed
values across the a{sv} boundary"), so the binary is built straight from
upstream: master snapshot `65734b6`, versioned `1.6.6.r6.g65734b6`.

This is a stopgap update: the intended successor is
`xdg-desktop-portal-gtk4-bin`, which is waiting for AUR adoption. The package
can be dropped once that one is available.

## Rebuild the binary

```sh
curl -LO https://github.com/JohnRTitor/xdg-desktop-portal-gtk4/archive/65734b6.tar.gz
tar -xzf 65734b6.tar.gz
cd xdg-desktop-portal-gtk4-65734b6e63fcf6ef37e2daca2af9e41ed8b801f5
cargo build --release --locked
strip target/release/xdg-desktop-portal-gtk4
```

Stage the binary together with `gtk4.portal`, the D-Bus service, the systemd
user unit, the desktop file and `LICENSE` (`make install DESTDIR=… PREFIX=/usr
LIBEXECDIR=/usr/lib` produces them), then attach the tarball to a GitLab
release of `xdg-desktop-portal-gtk4-bin`. The `PKGBUILD` downloads that asset.
