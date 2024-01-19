pkgname=erigon-bin
pkgdesc='Ethereum implementation on the efficiency frontier. Binary distribution'
pkgver=2.57.0
pkgrel=1
url='https://github.com/ledgerwatch/erigon'
provides=('erigon')
conflicts=('erigon')
arch=('x86_64')
license=('GPL3')
source=("https://github.com/ledgerwatch/erigon/releases/download/v2.57.0/erigon_2.57.0_linux_amd64.tar.gz")
b2sums=('69af22561c2d2e7db8989b5a4020bcdceb9eac2639193535f92f4def157dbd01fa8641e96f6b29d6477f4bf4c6019081355702a1831010dbccf9606157e78b9a')

package() {
    install -Dm755 erigon "${pkgdir}"/usr/bin/erigon
}
