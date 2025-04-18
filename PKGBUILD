pkgname=erigon-bin
pkgdesc='Ethereum implementation on the efficiency frontier. Binary distribution'
pkgver=3.0.2
pkgrel=1
url='https://github.com/erigontech/erigon'
provides=('erigon')
conflicts=('erigon')
arch=('x86_64')
license=('GPL3')
source=("https://github.com/erigontech/erigon/releases/download/v3.0.2/erigon_v3.0.2_linux_amd64.tar.gz")
b2sums=('ddbcc2dc1b76d3067a061cce210f8427fa0d048ec98010e0fa3db7197320ce474675b4bdb67356690b5b55fd900c136e54a67e36dbb1d47e7d34862ae7b241e5')

package() {
    install -Dm755 erigon "${pkgdir}"/usr/bin/erigon
}
