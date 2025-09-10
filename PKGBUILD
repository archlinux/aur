pkgname=erigon-bin
pkgdesc='Ethereum implementation on the efficiency frontier. Binary distribution'
pkgver=3.0.17
pkgrel=1
url='https://github.com/erigontech/erigon'
provides=('erigon')
conflicts=('erigon')
arch=('x86_64')
license=('GPL3')
source=("https://github.com/erigontech/erigon/releases/download/v3.0.17/erigon_v3.0.17_linux_amd64.tar.gz")
b2sums=('c338063158f53f6cd2698d840fa8573b5535538265cb83acdeb6ff620bf79ef4a5772ed04f78fd74ebd741abbe7786d8d0ac8a7b8d121d150e378b2596abf78c')

package() {
    install -Dm755 erigon "${pkgdir}"/usr/bin/erigon
}
