pkgname=erigon-bin
pkgdesc='Ethereum implementation on the efficiency frontier. Binary distribution'
pkgver=3.0.12
pkgrel=1
url='https://github.com/erigontech/erigon'
provides=('erigon')
conflicts=('erigon')
arch=('x86_64')
license=('GPL3')
source=("https://github.com/erigontech/erigon/releases/download/v3.0.12/erigon_v3.0.12_linux_amd64.tar.gz")
b2sums=('7dd6f6a658f105b38e6af8ade4b9d1b2068384cfd6d10efd4861dbeeb9e37650b40e50b60612f08d6d61c683b89bb9e2b9f9ec73bd57312cbdcf83790870ff99')

package() {
    install -Dm755 erigon "${pkgdir}"/usr/bin/erigon
}
