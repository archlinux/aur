pkgname=erigon-bin
pkgdesc='Ethereum implementation on the efficiency frontier. Binary distribution'
pkgver=3.8.2
pkgrel=1
url='https://github.com/erigontech/erigon'
provides=('erigon')
conflicts=('erigon')
arch=('x86_64')
license=('GPL3')
source=("https://github.com/erigontech/erigon/releases/download/v3.8.2/erigon_v3.8.2_linux_amd64.tar.gz")
b2sums=('8a20919b2f1f1b440aad8a673224c817804c423f5ad01047c4fa53c14ef7a163712349abea9ac219a5b7b36ffb48594dfd934f9167a9d0d59d4c466b13ce691c')

package() {
    install -Dm755 erigon "${pkgdir}"/usr/bin/erigon
}
