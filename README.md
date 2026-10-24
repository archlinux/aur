# rustconn-bin

Repackages the official RustConn 0.23.21 amd64 Debian release for Arch Linux.
The release's SHA-256 is pinned in `PKGBUILD`; no source compilation is needed.

Includes `rustconn` and `rustconn-cli`, the upstream desktop entry, icons,
translations, AppStream metadata and documentation. Both binaries use Arch's
system libraries directly. No AppImage runtime or FUSE is needed, and no wrapper
forces the GTK backend to X11. The upstream Debian release requires glibc 2.39+,
GTK 4.14+, libadwaita 1.5+ and VTE 0.76+; these minimum versions are declared.

The two MIME definitions are copied unchanged from the upstream v0.23.21 tag,
because the Debian package omits them despite declaring the file associations.

Provides `rustconn=0.23.21` and explicitly conflicts with `rustconn` and
`rustconn-appimage`. These variants install overlapping commands, desktop
entries, icons, translations and file associations and cannot coexist.

Build with `makepkg -s`. Install the resulting package with `pacman -U`.
The build validates the desktop entry and AppStream metadata and checks both
binaries' version output. Optional external clients and credential providers
are listed in `optdepends`.
