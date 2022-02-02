# Maintainer: Gomasy <nyan@gomasy.jp>

pkgname=ibus-autostart
pkgver=1
pkgrel=1
pkgdesc="iBus daemon autostart with XDG Autostart Specification"
arch=('any')
license=('none')

package() {
  mkdir -p "$pkgdir/etc/xdg/autostart"
  cat <<'EOF' > "$pkgdir/etc/xdg/autostart/ibus-daemon.desktop"
[Desktop Entry]
Type=Application
Icon=ibus
Name=iBus daemon
Comment=Intellicent Input Bus
Exec=ibus-daemon -drxR
Terminal=false
EOF
}
