pkgname=erigon-bin
pkgdesc='Ethereum implementation on the efficiency frontier. Binary distribution'
pkgver=2.50.1
pkgrel=1
url='https://github.com/ledgerwatch/erigon'
provides=('erigon')
conflicts=('erigon')
arch=('x86_64')
license=('GPL3')
source=("https://github.com/ledgerwatch/erigon/releases/download/v2.50.1/erigon_2.50.1_linux_amd64.tar.gz")
b2sums=('37b914548f80422f951e5c31dc0af3d85e78c5ef4e517a5454097e35e54f0745dde6790b1410f27f46981e230299f6ee6b8705714fc902e76852f98f87b4874b')

package() {
    install -Dm755 erigon "${pkgdir}"/usr/bin/erigon
}
