pkgname=erigon-bin
pkgdesc='Ethereum implementation on the efficiency frontier. Binary distribution'
pkgver=3.0.8
pkgrel=1
url='https://github.com/erigontech/erigon'
provides=('erigon')
conflicts=('erigon')
arch=('x86_64')
license=('GPL3')
source=("https://github.com/erigontech/erigon/releases/download/v3.0.8/erigon_v3.0.8_linux_amd64.tar.gz")
b2sums=('3ce94088250d0ee7c7c5828eea51618166494394b8ad010546efcbb96e4e32b2e2f3d5ea9afb7761957ca05f11609bb0cec8d4bdf99f1cd116c9c11fa049b880')

package() {
    install -Dm755 erigon "${pkgdir}"/usr/bin/erigon
}
