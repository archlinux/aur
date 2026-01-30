pkgname=erigon-bin
pkgdesc='Ethereum implementation on the efficiency frontier. Binary distribution'
pkgver=3.3.7
pkgrel=1
url='https://github.com/erigontech/erigon'
provides=('erigon')
conflicts=('erigon')
arch=('x86_64')
license=('GPL3')
source=("https://github.com/erigontech/erigon/releases/download/v3.3.7/erigon_v3.3.7_linux_amd64.tar.gz")
b2sums=('c43d3bf71dfe695e07e8adaceb49b78949a804ab4c27fa3f0a4a2b9026b992c5f65fff14fca3525f65c8a59036214fa7e015060cfa838171b859f5ee974002b2')

package() {
    install -Dm755 erigon "${pkgdir}"/usr/bin/erigon
}
