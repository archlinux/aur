pkgname=erigon-bin
pkgdesc='Ethereum implementation on the efficiency frontier. Binary distribution'
pkgver=2.52.5
pkgrel=1
url='https://github.com/ledgerwatch/erigon'
provides=('erigon')
conflicts=('erigon')
arch=('x86_64')
license=('GPL3')
source=("https://github.com/ledgerwatch/erigon/releases/download/v2.52.5/erigon_2.52.5_linux_amd64.tar.gz")
b2sums=('0f8832f84d4c4d55ac49a06cb20c3b89cf3bf2a9de3b9e86f5153bd0370b4d05ee86956a6a654a77a6fcdf8277b65c4e8897bb1f3f1b3c6fe91231720c01f08d')

package() {
    install -Dm755 erigon "${pkgdir}"/usr/bin/erigon
}
