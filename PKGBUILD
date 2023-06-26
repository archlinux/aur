# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
# Contributor: Dimitris Kiziridis <ragouel at outlook dot com>
pkgname=utask-bin
pkgver=1.26.1
pkgrel=1
pkgdesc="An automation engine that models and executes business processes declared in yaml"
arch=('x86_64')
url='https://github.com/ovh/utask'
license=('BSD3')
conflicts=("${pkgname%-bin}")
source=("${pkgname}-${pkgver}.tar.gz::${url}/releases/download/v${pkgver}/${pkgname%-bin}_Linux_x86_64.tar.gz")
sha256sums=('8d5097414bb0744df5575f21c55ee8a9d31c4f2738b44a8b0190f23d520fcf24')

package() {
  install -Dm755 "${srcdir}/${pkgname%-bin}" "${pkgdir}/usr/bin/${pkgname%-bin}"
  install -Dm644 "${srcdir}/README.md" -t "${pkgdir}/usr/share/doc/${pkgname%-bin}"
  install -Dm644 "${srcdir}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}