pkgname=erigon-bin
pkgdesc='Ethereum implementation on the efficiency frontier. Binary distribution'
pkgver=3.0.7
pkgrel=1
url='https://github.com/erigontech/erigon'
provides=('erigon')
conflicts=('erigon')
arch=('x86_64')
license=('GPL3')
source=("https://github.com/erigontech/erigon/releases/download/v3.0.7/erigon_v3.0.7_linux_amd64.tar.gz")
b2sums=('3d5d7b54eeacd3a7d2613ee6c3462b8b85a95678ae5e5482cbd1b0b9a82de9c65668e1e5d3664bfdddb7a297e82043b4ed4167835de2cdd597fe325cc5d4d006')

package() {
    install -Dm755 erigon "${pkgdir}"/usr/bin/erigon
}
