# Maintainer: Ramana Kumar <ramana@member.fsf.org>
pkgname=erigon-bin
pkgver=2.39.0
pkgrel=1
pkgdesc="Ethereum implementation on the efficiency frontier"
arch=('x86_64')
url="https://github.com/ledgerwatch/erigon"
license=('GPL3')
source=("${pkgname%-bin}-${pkgver}.tar.gz::$url/releases/download/v$pkgver/${pkgname%-bin}_${pkgver}_linux_amd64.tar.gz")
sha256sums=('ac9b97c7285df4e7c0375e11c0e4c8d99dcf6e8fd2369e7a4b2ec3a88ea438d3')

package() {
  install -Dm755 erigon "${pkgdir}"/usr/bin/erigon
}
