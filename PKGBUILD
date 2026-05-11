pkgname=erigon-bin
pkgdesc='Ethereum implementation on the efficiency frontier. Binary distribution'
pkgver=3.4.1
pkgrel=1
url='https://github.com/erigontech/erigon'
provides=('erigon')
conflicts=('erigon')
arch=('x86_64')
license=('GPL3')
source=("https://github.com/erigontech/erigon/releases/download/v3.4.1/erigon_v3.4.1_linux_amd64.tar.gz")
b2sums=('5acf7e55e8b2c93cb68f02bc742d73489c5d8c76a662208ec1f90bd838160eea7e09df015724affb3f4ba382974873bcac3103c1e910c8da88518823533bd869')

package() {
    install -Dm755 erigon "${pkgdir}"/usr/bin/erigon
}
