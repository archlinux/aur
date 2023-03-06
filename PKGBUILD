# Maintainer: Ramana Kumar <ramana@member.fsf.org>
pkgname=erigon-bin
pkgver=2.40.0
pkgrel=1
pkgdesc="Ethereum implementation on the efficiency frontier"
provides=('erigon')
conflicts=('erigon')
arch=('x86_64')
url="https://github.com/ledgerwatch/erigon"
license=('GPL3')
source=("${pkgname%-bin}-${pkgver}.tar.gz::$url/releases/download/v$pkgver/${pkgname%-bin}_${pkgver}_linux_amd64.tar.gz")
sha256sums=('884afeddadaf2cf5230fba809f9345f5c500376f60d2bbf4dbc414320b8b3f07')

package() {
  install -Dm755 erigon "${pkgdir}"/usr/bin/erigon
}
