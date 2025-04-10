pkgname=erigon-bin
pkgdesc='Ethereum implementation on the efficiency frontier. Binary distribution'
pkgver=3.0.1
pkgrel=1
url='https://github.com/erigontech/erigon'
provides=('erigon')
conflicts=('erigon')
arch=('x86_64')
license=('GPL3')
source=("https://github.com/erigontech/erigon/releases/download/v3.0.1/erigon_v3.0.1_linux_amd64.tar.gz")
b2sums=('868bcb3be7c87d3233ed7f4b210fcf0b6a7bdda41d81e732872c9a880444c44d6b8db8fe0a690f9138696c44eb2c5e8b7877b13bba7d5062113983c38d880ed5')

package() {
    install -Dm755 erigon "${pkgdir}"/usr/bin/erigon
}
