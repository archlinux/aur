# Maintainer: dougEfresh <dchimento@gmail.com>
pkgname=pi-ext-boomerang
pkgver=0.4.5
pkgrel=1
pkgdesc='Token-efficient autonomous task execution extension for pi coding agent'
arch=('any')
url='https://github.com/nicobailon/pi-boomerang'
license=('MIT')
source=(
  "${pkgname}-${pkgver}.tar.gz::https://github.com/nicobailon/pi-boomerang/archive/refs/tags/v${pkgver}.tar.gz"
)
sha256sums=('a6f6edb978f4f679b4581b4bcd68d7d4f05ffdcb44daf04a66cd9cd1c12167e8')
install=pi-ext.install

package() {
  install -d "${pkgdir}/usr/share/pi/extensions/boomerang"
  cp -a "${srcdir}/pi-boomerang-${pkgver}/." "${pkgdir}/usr/share/pi/extensions/boomerang/"
  rm -f "${pkgdir}/usr/share/pi/extensions/boomerang/"*.test.ts
  rm -f "${pkgdir}/usr/share/pi/extensions/boomerang/vitest.config.ts"
}
