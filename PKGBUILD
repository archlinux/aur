pkgname=erigon-bin
pkgdesc='Ethereum implementation on the efficiency frontier. Binary distribution'
pkgver=2.58.0
pkgrel=1
url='https://github.com/ledgerwatch/erigon'
provides=('erigon')
conflicts=('erigon')
arch=('x86_64')
license=('GPL3')
source=("https://github.com/ledgerwatch/erigon/releases/download/v2.58.0/erigon_2.58.0_linux_amd64.tar.gz")
b2sums=('e20f107ec7973db895171864cb11a11c451cd890f95878e166717ba0decf91561486f6c66c466ff24a2af9fa958d7adc02e78bdf57793316f18603b113c847be')

package() {
    install -Dm755 erigon "${pkgdir}"/usr/bin/erigon
}
