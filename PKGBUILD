pkgname=erigon-bin
pkgdesc='Ethereum implementation on the efficiency frontier. Binary distribution'
pkgver=2.56.2
pkgrel=1
url='https://github.com/ledgerwatch/erigon'
provides=('erigon')
conflicts=('erigon')
arch=('x86_64')
license=('GPL3')
source=("https://github.com/ledgerwatch/erigon/releases/download/v2.56.2/erigon_2.56.2_linux_amd64.tar.gz")
b2sums=('85b510676427224f7b4b9cbb4dbd2cefb84f819ff908d7c6cebe8a60ba0641fe166703272c4975642f1fd7b50e84e7831a4e90c37068c02f3fc3048d637d4465')

package() {
    install -Dm755 erigon "${pkgdir}"/usr/bin/erigon
}
