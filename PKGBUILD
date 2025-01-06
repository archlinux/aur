pkgname=erigon-bin
pkgdesc='Ethereum implementation on the efficiency frontier. Binary distribution'
pkgver=2.61.0
pkgrel=1
url='https://github.com/erigontech/erigon'
provides=('erigon')
conflicts=('erigon')
arch=('x86_64')
license=('GPL3')
source=("https://github.com/erigontech/erigon/releases/download/v2.61.0/erigon_v2.61.0_linux_amd64.tar.gz")
b2sums=('834a8bd4a592ac01076b8161d03a966dc0ecc7dd3d769e5de2436114dde71500e11c9a21b50dcb7fc259e093840a35f822678d56405122ed4da752e5a0fe6da1')

package() {
    install -Dm755 erigon "${pkgdir}"/usr/bin/erigon
}
