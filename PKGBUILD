pkgname=erigon-bin
pkgdesc='Ethereum implementation on the efficiency frontier. Binary distribution'
pkgver=3.0.0
pkgrel=1
url='https://github.com/erigontech/erigon'
provides=('erigon')
conflicts=('erigon')
arch=('x86_64')
license=('GPL3')
source=("https://github.com/erigontech/erigon/releases/download/v3.0.0/erigon_v3.0.0_linux_amd64.tar.gz")
b2sums=('c6ab25ca1558078648060fc0396bd96378ad55e2d9d7130982130b3eaf9e8fd5e0612a4a83ab7cf98f46336898e741a673f35ceae14bd7d3b62eda0eaeacaae7')

package() {
    install -Dm755 erigon "${pkgdir}"/usr/bin/erigon
}
