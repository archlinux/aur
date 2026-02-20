pkgname=erigon-bin
pkgdesc='Ethereum implementation on the efficiency frontier. Binary distribution'
pkgver=3.3.8
pkgrel=1
url='https://github.com/erigontech/erigon'
provides=('erigon')
conflicts=('erigon')
arch=('x86_64')
license=('GPL3')
source=("https://github.com/erigontech/erigon/releases/download/v3.3.8/erigon_v3.3.8_linux_amd64.tar.gz")
b2sums=('51ee0efd532a23851eef8259a1982b5b4faa03fdee2eac307277da7d790fbfcd71003217f0c234b42b94fa6ba64f69b723402c4afb6b7253e76b52e2bd869db3')

package() {
    install -Dm755 erigon "${pkgdir}"/usr/bin/erigon
}
