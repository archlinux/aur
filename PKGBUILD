# Maintainer: dougEfresh <dchimento@gmail.com>
pkgname=pi-ext-boomerang
pkgver=0.6.6
pkgrel=1
pkgdesc='Token-efficient autonomous task execution extension for pi coding agent'
arch=('any')
url='https://github.com/nicobailon/pi-boomerang'
license=('MIT')
source=(
  "${pkgname}-${pkgver}.tar.gz::https://github.com/nicobailon/pi-boomerang/archive/refs/tags/v${pkgver}.tar.gz"
)
sha256sums=('e2abf358b100d8652f8df23c02a323d2a99c3032979d5a3ad8906136c8472cbb')
install=pi-ext.install

package() {
  install -d "${pkgdir}/usr/share/pi/extensions/boomerang"
  cp -a "${srcdir}/pi-boomerang-${pkgver}/." "${pkgdir}/usr/share/pi/extensions/boomerang/"
  rm -f "${pkgdir}/usr/share/pi/extensions/boomerang/"*.test.ts
  rm -f "${pkgdir}/usr/share/pi/extensions/boomerang/vitest.config.ts"
}
