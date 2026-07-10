pkgname=erigon-bin
pkgdesc='Ethereum implementation on the efficiency frontier. Binary distribution'
pkgver=3.5.1
pkgrel=1
url='https://github.com/erigontech/erigon'
provides=('erigon')
conflicts=('erigon')
arch=('x86_64')
license=('GPL3')
source=("https://github.com/erigontech/erigon/releases/download/v3.5.1/erigon_v3.5.1_linux_amd64.tar.gz")
b2sums=('21f26117f9eed082c784ab838e503bc06c5c942d87cfd55b773172cdfaadd04907b6bc74ca857f42829771898255199f88b214f159dc4272373534046ac89054')

package() {
    install -Dm755 erigon "${pkgdir}"/usr/bin/erigon
}
