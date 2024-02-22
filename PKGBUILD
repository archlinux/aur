pkgname=erigon-bin
pkgdesc='Ethereum implementation on the efficiency frontier. Binary distribution'
pkgver=2.58.1
pkgrel=1
url='https://github.com/ledgerwatch/erigon'
provides=('erigon')
conflicts=('erigon')
arch=('x86_64')
license=('GPL3')
source=("https://github.com/ledgerwatch/erigon/releases/download/v2.58.1/erigon_2.58.1_linux_amd64.tar.gz")
b2sums=('78433723432b3701e99379f4a4b8f6ccfdcc8d9c5cb076f4fee7bccf4ad9a9773e2e1522808097008a813bd7d49c69c41d0b312e70bfd48d9ccb55f2c9dadbc3')

package() {
    install -Dm755 erigon "${pkgdir}"/usr/bin/erigon
}
