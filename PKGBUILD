# Maintainer: Dimitris Kiziridis <ragouel at outlook dot com>

pkgname=utask-bin
pkgver=1.6.0
pkgrel=1
pkgdesc="An automation engine that models and executes business processes declared in yaml"
arch=('x86_64')
url='https://github.com/ovh/utask'
license=('BSD')
provides=("${pkgname%-bin}")
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/ovh/utask/releases/download/v${pkgver}/utask_Linux_x86_64.tar.gz")
sha256sums=('8764ba0d34954e88443251971817afa40d059213ab4427864585a588c33ff088')

package() {
  install -Dm755 "${srcdir}/${pkgname%-bin}" \
   "${pkgdir}/usr/bin/${pkgname%-bin}"
  install -Dm644 "${srcdir}/README.md" \
   -t "${pkgdir}/usr/share/doc/${pkgname%-bin}"
  install -Dm644 "${srcdir}/LICENSE" \
   -t "${pkgdir}/usr/share/licenses/${pkgname}"
}