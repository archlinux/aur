# Maintainer: Hao Long <aur@esd.cc>

pkgname=gosec-bin
pkgver=2.21.3
pkgrel=1
pkgdesc="Inspects source code for security problems by scanning the Go AST"
arch=("x86_64")
url="https://github.com/securego/gosec"
license=("Apache")
source=("https://github.com/securego/gosec/releases/download/v${pkgver}/gosec_${pkgver}_linux_amd64.tar.gz")
b2sums=('db1d92cab5c5445384502c4b4b6ffd5093d2cd9c8979d61cdaf5a8cd9e2b0e6e2b87fbfc39c09b63a2df200e7aeefe25bfd66f41bf245ce74513893029bc59a7')

package() {
    install -Dm644 LICENSE.txt "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
    install -Dm755 gosec ${pkgdir}/usr/bin/gosec
}
