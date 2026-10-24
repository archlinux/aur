# rustconn-appimage

AUR package for the official RustConn x86_64 AppImage. The original AppImage is
installed at `/opt/rustconn/RustConn.AppImage`, with a `rustconn` command, desktop
entry, hicolor icons, AppStream metadata and RDP / virt-viewer file associations.
The two MIME definitions are copied unchanged from the upstream v0.23.21 tag.

Build with `makepkg -s`, then install the resulting package with `pacman -U`.
The AppImage SHA-256 is pinned to the digest published with the GitHub release.

FUSE 2 is required at runtime. Additional dependencies cover system libraries
excluded from the AppImage and the upstream GTK startup hook. The upstream
AppImage forces the X11 backend, so Wayland sessions need Xwayland. This package
exposes the GUI; it does not install a separate `rustconn-cli` command.

This package conflicts with other packages providing `rustconn`.
