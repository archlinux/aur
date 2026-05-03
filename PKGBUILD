# Maintainer: dougEfresh <dchimento@gmail.com>
pkgname=pi-ext-boomerang
pkgver=0.6.3
pkgrel=1
pkgdesc='Token-efficient autonomous task execution extension for pi coding agent'
arch=('any')
url='https://github.com/nicobailon/pi-boomerang'
license=('MIT')
source=(
  "${pkgname}-${pkgver}.tar.gz::https://github.com/nicobailon/pi-boomerang/archive/refs/tags/v${pkgver}.tar.gz"
)
sha256sums=('9e89b07d820e3b0032a06080e18e7e10e81fbee2969a228f2403be2a9f726867')
install=pi-ext.install

package() {
  install -d "${pkgdir}/usr/share/pi/extensions/boomerang"
  cp -a "${srcdir}/pi-boomerang-${pkgver}/." "${pkgdir}/usr/share/pi/extensions/boomerang/"
  rm -f "${pkgdir}/usr/share/pi/extensions/boomerang/"*.test.ts
  rm -f "${pkgdir}/usr/share/pi/extensions/boomerang/vitest.config.ts"
}
