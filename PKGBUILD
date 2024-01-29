pkgname=erigon-bin
pkgdesc='Ethereum implementation on the efficiency frontier. Binary distribution'
pkgver=2.57.2
pkgrel=1
url='https://github.com/ledgerwatch/erigon'
provides=('erigon')
conflicts=('erigon')
arch=('x86_64')
license=('GPL3')
source=("https://github.com/ledgerwatch/erigon/releases/download/v2.57.2/erigon_2.57.2_linux_amd64.tar.gz")
b2sums=('cd4274a7139bc0919e66880358b38c34194d345a0835ae0351933891ca732f979c9fdc1f906099b0340ecfdf5f084ecc79ba0885fe704a5d4f96d29ad1859353')

package() {
    install -Dm755 erigon "${pkgdir}"/usr/bin/erigon
}
