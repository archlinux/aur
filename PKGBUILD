pkgname=erigon-bin
pkgdesc='Ethereum implementation on the efficiency frontier. Binary distribution'
pkgver=2.54.0
pkgrel=1
url='https://github.com/ledgerwatch/erigon'
provides=('erigon')
conflicts=('erigon')
arch=('x86_64')
license=('GPL3')
source=("https://github.com/ledgerwatch/erigon/releases/download/v${pkgver}/erigon_${pkgver}_linux_amd64.tar.gz")
sha256sums=('c7936d50ffe28b61b8a5755361345fef6c820da3c7df0f1613036297cbbf2e0a')

package() {
    install -Dm755 erigon "${pkgdir}"/usr/bin/erigon
}
