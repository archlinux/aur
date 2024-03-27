pkgname=erigon-bin
pkgdesc='Ethereum implementation on the efficiency frontier. Binary distribution'
pkgver=2.59.1
pkgrel=1
url='https://github.com/ledgerwatch/erigon'
provides=('erigon')
conflicts=('erigon')
arch=('x86_64')
license=('GPL3')
source=("https://github.com/ledgerwatch/erigon/releases/download/v2.59.1/erigon_2.59.1_linux_amd64.tar.gz")
b2sums=('3cdc939b5c9c38d89ca94d6be07a53b6aad2bf5f2bc7d7ebbcde7b02f08618a395124879006644555de2a22378afa8d910c73067df2ba514b0a121ced9c1b819')

package() {
    install -Dm755 erigon "${pkgdir}"/usr/bin/erigon
}
