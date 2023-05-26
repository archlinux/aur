# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
# Contributor: Dimitris Kiziridis <ragouel at outlook dot com>
pkgname=utask-bin
pkgver=1.26.0
pkgrel=1
pkgdesc="An automation engine that models and executes business processes declared in yaml"
arch=('x86_64')
url='https://github.com/ovh/utask'
license=('custom:BSD3-Clause')
provides=()
conflicts=("${pkgname%-bin}")
options=(!strip)
source=("${pkgname}-${pkgver}.tar.gz::${url}/releases/download/v${pkgver}/${pkgname%-bin}_Linux_x86_64.tar.gz")
sha256sums=('bfe0b2a68f97cfdfc4ffca52b346cf2281425c1b40b3b355946a7913b7a98522')

package() {
  install -Dm755 "${srcdir}/${pkgname%-bin}" "${pkgdir}/usr/bin/${pkgname%-bin}"
  install -Dm644 "${srcdir}/README.md" -t "${pkgdir}/usr/share/doc/${pkgname%-bin}"
  install -Dm644 "${srcdir}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}