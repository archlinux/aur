# Maintainer: Harry Jeffery <harry|@|exec64|.|co|.|uk>

pkgname=imv
pkgver=1.0.0
pkgrel=2
pkgdesc="Image viewer for Wayland and X11"
url="http://github.com/eXeC64/imv"
arch=('x86_64' 'i686')
license=('MIT')
depends=(
  'freeimage'
  'sdl2'
)
conflicts=('renameutils')
source=("$pkgname::git://github.com/eXeC64/imv.git#tag=v${pkgver}")
sha1sums=('SKIP')

build() {
  cd "${srcdir}/${pkgname}"
  make
}

package() {
  cd "${srcdir}/${pkgname}"
  make DESTDIR="${pkgdir}" install
}

# vim:set ts=2 sw=2 et:
