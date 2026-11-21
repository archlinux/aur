# xdg-desktop-portal-gtk4-printfix-bin

Arch Linux `-bin` package for [xdg-desktop-portal-gtk4](https://github.com/JohnRTitor/xdg-desktop-portal-gtk4),
prebuilt from upstream `master`.

The Print portal fixes this package used to carry as `print-single-call.patch`
are upstream since commit `3461d7e` ("print: support single-call Print and fix
fd lifetime"), so the binary is now built straight from upstream: master
snapshot `9fc147b`, versioned `1.6.6.r3.g9fc147b`. The package can be dropped
once upstream ships a release with the fix and a stable source is available.

## Rebuild the binary

```sh
curl -LO https://github.com/JohnRTitor/xdg-desktop-portal-gtk4/archive/9fc147b.tar.gz
tar -xzf 9fc147b.tar.gz
cd xdg-desktop-portal-gtk4-9fc147b5f47f30b2086fe11e05d0f9584c42941c
cargo build --release --locked
strip target/release/xdg-desktop-portal-gtk4
```

Stage the binary together with `gtk4.portal`, the D-Bus service, the systemd
user unit, the desktop file and `LICENSE` (`make install DESTDIR=… PREFIX=/usr
LIBEXECDIR=/usr/lib` produces them), then attach the tarball to a GitLab
release of this project. The `PKGBUILD` downloads that asset.
