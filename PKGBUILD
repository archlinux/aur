# Maintainer: Ramana Kumar <ramana@member.fsf.org>
pkgname=erigon-bin
pkgver=2.47.0
pkgrel=1
pkgdesc="Ethereum implementation on the efficiency frontier"
provides=('erigon')
conflicts=('erigon')
arch=('x86_64')
url="https://github.com/ledgerwatch/erigon"
license=('GPL3')
source=("${pkgname%-bin}-${pkgver}.tar.gz::$url/releases/download/v$pkgver/${pkgname%-bin}_${pkgver}_linux_amd64.tar.gz")
sha256sums=('f9b2df9dc3d108ea58f6a9c9c13552ac23de2e107e5901dfb9c2086748655be5')

package() {
  install -Dm755 erigon "${pkgdir}"/usr/bin/erigon
}
