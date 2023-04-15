# Maintainer: Dimitris Kiziridis <ragouel at outlook dot com>

pkgname=nostromo-bin
pkgver=0.12.0
pkgrel=1
pkgdesc="CLI for building powerful aliases"
arch=('x86_64')
url='https://nostromo.sh'
license=('MIT')
provides=("${pkgname%-bin}")
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/pokanop/nostromo/releases/download/v${pkgver}/nostromo_Linux_x86_64.tar.gz")
sha256sums=('3ebb212029c1694480c1059e07db77d378e715de47ee8c1e0b6f2905be765955')

package() {
  install -Dm755 "${srcdir}/${pkgname%-bin}" \
   "${pkgdir}/usr/bin/${pkgname%-bin}"
  install -Dm644 "${srcdir}/LICENSE" \
   "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm644 "${srcdir}/README.md" \
   -t "${pkgdir}/usr/share/doc/${pkgname%-bin}"
}
