# Maintainer: HAHWUL <hahwul@gmail.com>
pkgname=doma
pkgver=0.3.0
pkgrel=1
pkgdesc="Directory tag manager — put your directories on the cutting board (Crystal CLI)."
arch=('x86_64')
url="https://github.com/hahwul/doma"
license=('MIT')
depends=('sqlite')
source=("doma-${pkgver}::https://github.com/hahwul/doma/releases/download/v${pkgver}/doma-v${pkgver}-linux-x86_64")
sha256sums=('SKIP')

package() {
  install -Dm755 "${srcdir}/doma-${pkgver}" "${pkgdir}/usr/bin/doma"
  install -Dm644 "${srcdir}/../LICENSE" "${pkgdir}/usr/share/licenses/doma/LICENSE"
}
