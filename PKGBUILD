# Maintainer: Josh VanderLinden <arch@cloudlery.com>
pkgname=aws-lanes
pkgver=0.4.3
pkgrel=1
pkgdesc="Utility for interacting with different lanes of servers on AWS."
arch=('x86_64')
url="https://github.com/codekoala/go-aws-lanes"
license=('BSD')
source=("${pkgname}-${pkgver}.tar.gz::${url}/releases/download/v${pkgver}/lanes_linux_amd64.tar.gz")
sha256sums=('50fe2998db8265379cffc620b373199a91ae3b256aa82b3dc5c0686c3463c4fd')
options=(!strip)

package() {
  install -Dm755 "${srcdir}/lanes_linux_amd64" "${pkgdir}/usr/bin/lanes"
  install -Dm644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

# vim:set ts=2 sw=2 et ai:
