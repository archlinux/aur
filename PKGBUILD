# Maintainer: Thomas Weißschuh <thomas_weissschuh@lavabit.com>

pkgname=taterm
pkgver=1
pkgrel=1
pkgdesc="Terminal emulator for tiling window managers"
arch=('i686' 'x86_64')
url="https://github.com/t-8ch/taterm"
depends=('vte3' 'dbus')
makedepends=('vala')
license=('GPL3')
source=("${pkgname}-${pkgver}::https://github.com/t-8ch/taterm/tarball/v${pkgver}")

build() {
  cd ${srcdir}/t-8ch-${pkgname}-*

  make
}

package() {
  cd ${srcdir}/t-8ch-${pkgname}-*

  install -d ${pkgdir}/usr/bin/
  install -m 755 ${pkgname} ${pkgdir}/usr/bin/${pkgname}

}
# vim:set ts=2 sw=2 et:
sha1sums=('858f5c695def35e2d193342afa10ae7fedf0bb2d')
