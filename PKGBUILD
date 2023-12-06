pkgname=erigon-bin
pkgdesc='Ethereum implementation on the efficiency frontier. Binary distribution'
pkgver=2.55.1
pkgrel=1
url='https://github.com/ledgerwatch/erigon'
provides=('erigon')
conflicts=('erigon')
arch=('x86_64')
license=('GPL3')
source=("https://github.com/ledgerwatch/erigon/releases/download/v2.55.1/erigon_2.55.1_linux_amd64.tar.gz")
b2sums=('db482d8ff0330a1076217da7a9e7e5104de9d274a9549f71a82404f3d91cff83cb1e12adc619c4f8d958d4f98f4775d66d82c1fd85c6bc8e7e6f50132f3788d8')

package() {
    install -Dm755 erigon "${pkgdir}"/usr/bin/erigon
}
