pkgname=erigon-bin
pkgdesc='Ethereum implementation on the efficiency frontier. Binary distribution'
pkgver=2.60.2
pkgrel=1
url='https://github.com/ledgerwatch/erigon'
provides=('erigon')
conflicts=('erigon')
arch=('x86_64')
license=('GPL3')
source=("https://github.com/ledgerwatch/erigon/releases/download/v2.60.2/erigon_2.60.2_linux_amd64.tar.gz")
b2sums=('2f823f5dc4dcc542c700c4a10c574cdc6dfd650eee3a99e5f0414f9a5bd77bdcaa0d85e8a0e3be7d2582e55fea9cd557b5d9a4ddc726911125b0eaa31dbf1f48')

package() {
    install -Dm755 erigon "${pkgdir}"/usr/bin/erigon
}
