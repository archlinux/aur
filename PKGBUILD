# Maintainer: Marcel Hoppe <hoppe.marcel@gmail.com>

pkgname=retroarch-session
pkgbase=${pkgname}
pkgver=0.1
pkgrel=2
pkgdesc='Start retroarch via login manager as wayland or X11 session and shutdown the system when retroarch is closed.'
arch=('any')
license=('GPL')
depends=('xorg-xset' 'retroarch')

package() {
  install -D -m644 "$srcdir"/../retroarch.desktop "$pkgdir"/usr/share/wayland-sessions/retroarch.desktop
  install -D -m644 "$srcdir"/../retroarch-xorg.desktop "$pkgdir"/usr/share/xsessions/retroarch-xorg.desktop
  install -D -m755 "$srcdir"/../retroarch-session.sh "$pkgdir"/usr/bin/retroarch-session.sh
}
