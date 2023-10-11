pkgname=erigon-bin
pkgdesc='Ethereum implementation on the efficiency frontier. Binary distribution'
pkgver=2.52.0
pkgrel=1
url='https://github.com/ledgerwatch/erigon'
provides=('erigon')
conflicts=('erigon')
arch=('x86_64')
license=('GPL3')
source=("https://github.com/ledgerwatch/erigon/releases/download/v2.52.0/erigon_2.52.0_linux_amd64.tar.gz")
b2sums=('0772d0cbdb8fc7b84ea5091824e2742b79f6d66f2f4db0e32f5c481aca6b0614d9ac73c008be28f8c7830276f39ce2ea54993ba4965e66eb1ac1155372129f42')

package() {
    install -Dm755 erigon "${pkgdir}"/usr/bin/erigon
}
