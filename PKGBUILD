# Maintainer:  Alad Wenter

pkgname=xorg-xwrapper
pkgver=1
pkgrel=1
pkgdesc="Enable root privileges for Xorg server"
arch=('any')
url="https://wiki.archlinux.org/index.php/Xorg#Rootless_Xorg_.28v1.16.29"
license=('GPL')
optdepends=('xorg-server')
source=('Xwrapper.config')
sha256sums=('a8443af0a0bb5ae11820b10b648cd5c822a75b74e609a07f8ad3114e9b2240a1')

package() {
  mkdir -p "$pkgdir/etc/X11"
  install -m644 Xwrapper.config "$pkgdir/etc/X11"
}
