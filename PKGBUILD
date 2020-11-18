# Maintainer: Dimitris Kiziridis <ragouel at outlook dot com>

pkgname=utask-bin
pkgver=1.8.2
pkgrel=1
pkgdesc="An automation engine that models and executes business processes declared in yaml"
arch=('x86_64')
url='https://github.com/ovh/utask'
license=('BSD')
provides=("${pkgname%-bin}")
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/ovh/utask/releases/download/v${pkgver}/utask_Linux_x86_64.tar.gz")
sha256sums=('b831b676fe5bc0a0e38ac53c9eccabd14c867d7d83fa04222179e72c09d81a54')

package() {
  install -Dm755 "${srcdir}/${pkgname%-bin}" \
   "${pkgdir}/usr/bin/${pkgname%-bin}"
  install -Dm644 "${srcdir}/README.md" \
   -t "${pkgdir}/usr/share/doc/${pkgname%-bin}"
  install -Dm644 "${srcdir}/LICENSE" \
   -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
