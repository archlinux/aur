# Maintainer: dougEfresh <dchimento@gmail.com>
pkgname=pi-ext-boomerang
pkgver=0.6.5
pkgrel=1
pkgdesc='Token-efficient autonomous task execution extension for pi coding agent'
arch=('any')
url='https://github.com/nicobailon/pi-boomerang'
license=('MIT')
source=(
  "${pkgname}-${pkgver}.tar.gz::https://github.com/nicobailon/pi-boomerang/archive/refs/tags/v${pkgver}.tar.gz"
)
sha256sums=('595b6916a27589a3fa641d2e66ba9ed28282ffbeb98db44adeba1187d219c423')
install=pi-ext.install

package() {
  install -d "${pkgdir}/usr/share/pi/extensions/boomerang"
  cp -a "${srcdir}/pi-boomerang-${pkgver}/." "${pkgdir}/usr/share/pi/extensions/boomerang/"
  rm -f "${pkgdir}/usr/share/pi/extensions/boomerang/"*.test.ts
  rm -f "${pkgdir}/usr/share/pi/extensions/boomerang/vitest.config.ts"
}
