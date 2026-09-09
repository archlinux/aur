pkgname=erigon-bin
pkgdesc='Ethereum implementation on the efficiency frontier. Binary distribution'
pkgver=3.6.1
pkgrel=1
url='https://github.com/erigontech/erigon'
provides=('erigon')
conflicts=('erigon')
arch=('x86_64')
license=('GPL3')
source=("https://github.com/erigontech/erigon/releases/download/v3.6.1/erigon_v3.6.1_linux_amd64.tar.gz")
b2sums=('2bcf897ed51e47d2455d84a9eca8ed263245da00918cefc5e5dd6a218d412e3b3dbe28e5b4ceff77959657a9a622da2b9dca1b6ac7867e7ebd58f88095c729bc')

package() {
    install -Dm755 erigon "${pkgdir}"/usr/bin/erigon
}
