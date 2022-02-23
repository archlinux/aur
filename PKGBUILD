# Maintainer: Hao Long <aur@esd.cc>

pkgname=gosec-bin
pkgver=2.10.0
pkgrel=1
pkgdesc="Inspects source code for security problems by scanning the Go AST"
arch=("x86_64")
url="https://github.com/securego/gosec"
license=("Apache")
source=("https://github.com/securego/gosec/releases/download/v${pkgver}/gosec_${pkgver}_linux_amd64.tar.gz")
b2sums=('ec8c7b388b728200dd9f21464f94bc56a2c9e26eb1fa56b5b23af0fff8537750be4ca327d9ddc91d9132befdd7697bc82c6ad5a74fefd2869d9300b2a856a27f')

package() {
    install -Dm644 LICENSE.txt "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
    install -Dm755 gosec ${pkgdir}/usr/bin/gosec
}
