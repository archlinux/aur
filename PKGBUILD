# Maintainer: Ramana Kumar <ramana@member.fsf.org>
pkgname=erigon-bin
pkgver=2.43.0
pkgrel=1
pkgdesc="Ethereum implementation on the efficiency frontier"
provides=('erigon')
conflicts=('erigon')
arch=('x86_64')
url="https://github.com/ledgerwatch/erigon"
license=('GPL3')
source=("${pkgname%-bin}-${pkgver}.tar.gz::$url/releases/download/v$pkgver/${pkgname%-bin}_${pkgver}_linux_amd64.tar.gz")
sha256sums=('5c96802c38ac2b7ee60364190c17c6efd2af7887f776f59104043ba90eef6e01')

package() {
  install -Dm755 erigon "${pkgdir}"/usr/bin/erigon
}
