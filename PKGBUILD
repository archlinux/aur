pkgname=erigon-bin
pkgdesc='Ethereum implementation on the efficiency frontier. Binary distribution'
pkgver=2.60.10
pkgrel=1
url='https://github.com/erigontech/erigon'
provides=('erigon')
conflicts=('erigon')
arch=('x86_64')
license=('GPL3')
source=("https://github.com/erigontech/erigon/releases/download/v2.60.10/erigon_v2.60.10_linux_amd64.tar.gz")
b2sums=('58440fab31e80408c1d1a9090518234d25180735268b55ca1e8b80607c7998ca19b48727ec87425821055f24d70371403415ecadf2ee14b9217260a9a381c9ac')

package() {
    install -Dm755 erigon "${pkgdir}"/usr/bin/erigon
}
