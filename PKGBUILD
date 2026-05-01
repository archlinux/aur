# Maintainer: Hao Long <aur@esd.cc>

pkgname=gosec-bin
pkgver=2.26.1
pkgrel=1
pkgdesc="Inspects source code for security problems by scanning the Go AST"
arch=("x86_64")
url="https://github.com/securego/gosec"
license=("Apache")
source=("https://github.com/securego/gosec/releases/download/v${pkgver}/gosec_${pkgver}_linux_amd64.tar.gz")
b2sums=('79bce1b4b9343200bdc1c9cf613ca6f228b3107e70903385c26f5ed83b01769e3de95397db62ea82e48ca348f1b99eb965fca176890bbff13dd0ebd2154aa8d7')

package() {
    install -Dm644 LICENSE.txt "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
    install -Dm755 gosec ${pkgdir}/usr/bin/gosec
}
