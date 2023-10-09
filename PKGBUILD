# Maintainer: Hao Long <aur@esd.cc>

pkgname=gosec-bin
pkgver=2.18.0
pkgrel=1
pkgdesc="Inspects source code for security problems by scanning the Go AST"
arch=("x86_64")
url="https://github.com/securego/gosec"
license=("Apache")
source=("https://github.com/securego/gosec/releases/download/v${pkgver}/gosec_${pkgver}_linux_amd64.tar.gz")
b2sums=('cc8751228e7ee5ca819e4e227bef802c76632b2c3cb330b7035861812746296f133b761e34a7dd851479ee4512e783de29519122088c77d932f1355df680d6a2')

package() {
    install -Dm644 LICENSE.txt "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
    install -Dm755 gosec ${pkgdir}/usr/bin/gosec
}
