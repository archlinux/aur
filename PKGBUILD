# Maintainer: Ramana Kumar <ramana@member.fsf.org>
pkgname=erigon-bin
pkgver=2.49.0
pkgrel=1
pkgdesc="Ethereum implementation on the efficiency frontier"
provides=('erigon')
conflicts=('erigon')
arch=('x86_64')
url="https://github.com/ledgerwatch/erigon"
license=('GPL3')
source=("${pkgname%-bin}-${pkgver}.tar.gz::$url/releases/download/v$pkgver/${pkgname%-bin}_${pkgver}_linux_amd64.tar.gz")
sha256sums=('3055fa9d327e4b0eff608b9d1c5f0fb9c632b15a592ec590e8c2ffb9cefde99c')

package() {
  install -Dm755 erigon "${pkgdir}"/usr/bin/erigon
}
