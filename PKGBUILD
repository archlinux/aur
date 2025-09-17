pkgname=erigon-bin
pkgdesc='Ethereum implementation on the efficiency frontier. Binary distribution'
pkgver=3.1.0
pkgrel=1
url='https://github.com/erigontech/erigon'
provides=('erigon')
conflicts=('erigon')
arch=('x86_64')
license=('GPL3')
source=("https://github.com/erigontech/erigon/releases/download/v3.1.0/erigon_v3.1.0_linux_amd64.tar.gz")
b2sums=('b6a69b6fd1bb9e7c2ecc48b7ed3e3f798591c61dcea350ac0085f76df8bd035ff55011936677e414c5dd8be023265553a0bb090155e24f5c3bc52802053562b0')

package() {
    install -Dm755 erigon "${pkgdir}"/usr/bin/erigon
}
