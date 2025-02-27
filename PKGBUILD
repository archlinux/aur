pkgname=erigon-bin
pkgdesc='Ethereum implementation on the efficiency frontier. Binary distribution'
pkgver=2.61.2
pkgrel=1
url='https://github.com/erigontech/erigon'
provides=('erigon')
conflicts=('erigon')
arch=('x86_64')
license=('GPL3')
source=("https://github.com/erigontech/erigon/releases/download/v2.61.2/erigon_v2.61.2_linux_amd64.tar.gz")
b2sums=('e7c0b09004f46d740046c1832fd58327b168fb3ea504a361a21ba4a571213d15e3543f44c1f5b0609af3131563a716582c881a5b5d60095adeb716066abc4f05')

package() {
    install -Dm755 erigon "${pkgdir}"/usr/bin/erigon
}
