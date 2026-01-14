pkgname=erigon-bin
pkgdesc='Ethereum implementation on the efficiency frontier. Binary distribution'
pkgver=3.3.3
pkgrel=1
url='https://github.com/erigontech/erigon'
provides=('erigon')
conflicts=('erigon')
arch=('x86_64')
license=('GPL3')
source=("https://github.com/erigontech/erigon/releases/download/v3.3.3/erigon_v3.3.3_linux_amd64.tar.gz")
b2sums=('0e4cff9a8b7d9383296ca4cd02a08de7c4234b79b74b7ff66f41669c103f50f7aa84bf37fc9fb0441dfc49caabc92af1ed00041e115c0a1264524a79af5e7e6f')

package() {
    install -Dm755 erigon "${pkgdir}"/usr/bin/erigon
}
