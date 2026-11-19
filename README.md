# xdg-desktop-portal-gtk4-printfix-bin

Arch Linux `-bin` package for [xdg-desktop-portal-gtk4](https://github.com/JohnRTitor/xdg-desktop-portal-gtk4)
1.6.6 with the Print portal fixes from `print-single-call.patch`, which is
kept in this repository.

The release tarball installs a binary built from upstream v1.6.6 with that
patch applied, plus the portal, D-Bus, systemd and desktop files.

## Rebuild the binary

```sh
curl -LO https://github.com/JohnRTitor/xdg-desktop-portal-gtk4/releases/download/v1.6.6/xdg-desktop-portal-gtk4-1.6.6.tar.gz
tar -xzf xdg-desktop-portal-gtk4-1.6.6.tar.gz
cd xdg-desktop-portal-gtk4-1.6.6
patch -Np1 -i ../print-single-call.patch
cargo build --release --locked
strip target/release/xdg-desktop-portal-gtk4
```

Stage the binary together with `gtk4.portal`, the D-Bus service, the systemd
user unit, the desktop file and `LICENSE`, then attach the tarball to a GitLab
release of this project. The `PKGBUILD` downloads that asset.
