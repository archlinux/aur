pkgname=erigon-bin
pkgdesc='Ethereum implementation on the efficiency frontier. Binary distribution'
pkgver=3.3.4
pkgrel=1
url='https://github.com/erigontech/erigon'
provides=('erigon')
conflicts=('erigon')
arch=('x86_64')
license=('GPL3')
source=("https://github.com/erigontech/erigon/releases/download/v3.3.4/erigon_v3.3.4_linux_amd64.tar.gz")
b2sums=('ea70fe43f5d691461730986b88313f1742cd20e43edc2048ef33bfdfe168a9b01a471233fba19f542337d720c3b791a6e773543621214361e656fc4dd7aa5106')

package() {
    install -Dm755 erigon "${pkgdir}"/usr/bin/erigon
}
