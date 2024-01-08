pkgname=erigon-bin
pkgdesc='Ethereum implementation on the efficiency frontier. Binary distribution'
pkgver=2.56.1
pkgrel=1
url='https://github.com/ledgerwatch/erigon'
provides=('erigon')
conflicts=('erigon')
arch=('x86_64')
license=('GPL3')
source=("https://github.com/ledgerwatch/erigon/releases/download/v2.56.1/erigon_2.56.1_linux_amd64.tar.gz")
b2sums=('cb665b269ae0bd1ab4c183ab363ac883074b73d7529d2422521fe4f3094f7cf4ecae7a71e7775fb436a00c3ebefd2e3b4b4abde17e401708da31a24ba9e5800d')

package() {
    install -Dm755 erigon "${pkgdir}"/usr/bin/erigon
}
