pkgname=erigon-bin
pkgdesc='Ethereum implementation on the efficiency frontier. Binary distribution'
pkgver=3.0.13
pkgrel=1
url='https://github.com/erigontech/erigon'
provides=('erigon')
conflicts=('erigon')
arch=('x86_64')
license=('GPL3')
source=("https://github.com/erigontech/erigon/releases/download/v3.0.13/erigon_v3.0.13_linux_amd64.tar.gz")
b2sums=('2b72c748cc0283f0c4878e708136dfb859c189de4dcc787699033271915c306596f578d23103d3e6860799c3fe36e52d8ce3f3343fded9ef6b6fe9ba1bd15b7f')

package() {
    install -Dm755 erigon "${pkgdir}"/usr/bin/erigon
}
