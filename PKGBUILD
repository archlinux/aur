# Maintainer: Gomasy <nyan@gomasy.jp>

pkgname=ibus-autostart
pkgver=1.3
pkgrel=1
pkgdesc="iBus daemon autostart with XDG Autostart Specification"
arch=('any')
license=('none')
depends=('ibus')
conflicts=('ibus-autostart-kimpanel')

package() {
  mkdir -p "$pkgdir/etc/xdg/autostart"
  cat <<'EOF' > "$pkgdir/etc/xdg/autostart/ibus-daemon.desktop"
[Desktop Entry]
Name=IBus
GenericName=Input Method Framework
Comment=Start IBus Input Method Framework
Exec=ibus-daemon -rxR
Icon=ibus
NoDisplay=true
Type=Application
Categories=System;Utility;
EOF
}
