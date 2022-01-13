# Maintainer: Dimitris Kiziridis <ragouel at outlook dot com>

pkgname=nostromo-bin
pkgver=0.7.8
pkgrel=1
pkgdesc="CLI for building powerful aliases"
arch=('x86_64')
url='https://nostromo.sh'
license=('MIT')
provides=("${pkgname%-bin}")
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/pokanop/nostromo/releases/download/v${pkgver}/nostromo_${pkgver}_Linux_x86_64.tar.gz")
sha256sums=('1e0ad12b061f7182720e2d100e5d1a73caca48ea3a622fb059bf3b9063dc10e8')

package() {
  install -Dm755 "${srcdir}/${pkgname%-bin}" \
   "${pkgdir}/usr/bin/${pkgname%-bin}"
  install -Dm644 "${srcdir}/LICENSE" \
   "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm644 "${srcdir}/README.md" \
   -t "${pkgdir}/usr/share/doc/${pkgname%-bin}"
}
