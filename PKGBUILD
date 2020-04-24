# Maintainer: Dimitris Kiziridis <ragouel at outlook dot com>

pkgname=gfile-bin
pkgver=0.1.0
pkgrel=1
pkgdesc="Direct file transfer over WebRTC"
arch=('x86_64')
url='https://github.com/Antonito/gfile'
license=('MIT')
provides=("${pkgname%-bin}")
source=("${url}/releases/download/v${pkgver}/gfile_Linux_x86_64.tar.gz")
sha256sums=('d71d778d65b6ff9b39b5761ab4a3767e403d0f1e1866a890bb32fa68d6033a82')

package() {
  install -Dm755 "${srcdir}/${pkgname%-bin}" \
   "${pkgdir}/usr/bin/${pkgname%-bin}"
  install -Dm644 "${srcdir}/LICENSE" \
   "${pkgdir}/usr/share/licenses/${pkgname%-bin}/LICENSE"
  install -Dm644 "${srcdir}/README.md" \
   -t "${pkgdir}/usr/share/doc/${pkgname%-bin}"
}