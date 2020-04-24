# Maintainer: Dimitris Kiziridis <ragouel at outlook dot com>

pkgname=utask-bin
pkgver=1.5.0
pkgrel=1
pkgdesc="µTask is an automation engine that models and executes business processes declared in yaml"
arch=('x86_64')
url='https://github.com/ovh/utask'
license=('BSD-3-Clause')
provides=("${pkgname%-bin}")
source=("https://github.com/ovh/utask/releases/download/v${pkgver}/utask_Linux_x86_64.tar.gz")
sha256sums=('869eb19b4c04561df42f8f87c9c9b2d8c5ed2bfda0c082ab07d8674c02fff4bf')

package() {
  install -Dm755 "${srcdir}/${pkgname%-bin}" \
   "${pkgdir}/usr/bin/${pkgname%-bin}"
  install -Dm644 "${srcdir}/README.md" \
   -t "${pkgdir}/usr/share/doc/${pkgname%-bin}"
  install -Dm644 "${srcdir}/LICENSE" \
   -t "${pkgdir}/usr/share/licenses/${pkgname%-bin}"
}