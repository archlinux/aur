pkgname=erigon-bin
pkgdesc='Ethereum implementation on the efficiency frontier. Binary distribution'
pkgver=2.57.3
pkgrel=1
url='https://github.com/ledgerwatch/erigon'
provides=('erigon')
conflicts=('erigon')
arch=('x86_64')
license=('GPL3')
source=("https://github.com/ledgerwatch/erigon/releases/download/v2.57.3/erigon_2.57.3_linux_amd64.tar.gz")
b2sums=('c7a19b337cb9696e37149d4d7f727107f8c50d8ad2870d5e95aaa00391a80dc8994fae30948af49aaeadf44270a5b1ca73abb7167f04d36ae1a834816f9d930c')

package() {
    install -Dm755 erigon "${pkgdir}"/usr/bin/erigon
}
