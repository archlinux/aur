pkgname=erigon-bin
pkgdesc='Ethereum implementation on the efficiency frontier. Binary distribution'
pkgver=3.7.1
pkgrel=1
url='https://github.com/erigontech/erigon'
provides=('erigon')
conflicts=('erigon')
arch=('x86_64')
license=('GPL3')
source=("https://github.com/erigontech/erigon/releases/download/v3.7.1/erigon_v3.7.1_linux_amd64.tar.gz")
b2sums=('2b001a5b365aa2d06183266e15dd199777a1db2fd482635628d846034b6dd6d2ee13d0083cfe66c25fdee9a64da8cdf8f051825322a4948924891f71e823b726')

package() {
    install -Dm755 erigon "${pkgdir}"/usr/bin/erigon
}
