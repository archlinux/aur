# Maintainer: Dimitris Kiziridis <ragouel at outlook dot com>

pkgname=nostromo-bin
pkgver=0.7.7
pkgrel=1
pkgdesc="CLI for building powerful aliases"
arch=('x86_64')
url='https://nostromo.sh'
license=('MIT')
provides=("${pkgname%-bin}")
source=("https://github.com/pokanop/nostromo/releases/download/v${pkgver}/nostromo_${pkgver}_Linux_x86_64.tar.gz")
sha256sums=('a5d7227566ef7b18a921b8cb91479438d3793bfb19d70f5e062fc3ef423fffa5')

package() {
  install -Dm755 "${srcdir}/${pkgname%-bin}" \
   "${pkgdir}/usr/bin/${pkgname%-bin}"
  install -Dm644 "${srcdir}/LICENSE" \
   "${pkgdir}/usr/share/licenses/${pkgname%-bin}/LICENSE"
  install -Dm644 "${srcdir}/README.md" \
   -t "${pkgdir}/usr/share/doc/${pkgname%-bin}"
}