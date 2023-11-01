pkgname=erigon-bin
pkgdesc='Ethereum implementation on the efficiency frontier. Binary distribution'
pkgver=2.53.4
pkgrel=1
url='https://github.com/ledgerwatch/erigon'
provides=('erigon')
conflicts=('erigon')
arch=('x86_64')
license=('GPL3')
source=("https://github.com/ledgerwatch/erigon/releases/download/v2.53.4/erigon_2.53.4_linux_amd64.tar.gz")
b2sums=('558acba30bd7945ffb1fe928bd3cc1319cda9714eabe78888a9082a5b03740206d9213689a869e199e48c6b5ffb74fd8cd52a9812c2d629fb49cd2ff4defa5ce')

package() {
    install -Dm755 erigon "${pkgdir}"/usr/bin/erigon
}
