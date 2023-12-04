pkgname=erigon-bin
pkgdesc='Ethereum implementation on the efficiency frontier. Binary distribution'
pkgver=2.55.0
pkgrel=1
url='https://github.com/ledgerwatch/erigon'
provides=('erigon')
conflicts=('erigon')
arch=('x86_64')
license=('GPL3')
source=("https://github.com/ledgerwatch/erigon/releases/download/v2.55.0/erigon_2.55.0_linux_amd64.tar.gz")
b2sums=('8daf6c8664f218ee05683a59380cb902f5a658eec9809d3c505ce891586a5e8267e76da1072b992c6bfa62b3187468fd4252fff17a87561c781ffc19f543c507')

package() {
    install -Dm755 erigon "${pkgdir}"/usr/bin/erigon
}
