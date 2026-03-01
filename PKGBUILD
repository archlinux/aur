# Maintainer: Hao Long <aur@esd.cc>

pkgname=gosec-bin
pkgver=2.24.6
pkgrel=1
pkgdesc="Inspects source code for security problems by scanning the Go AST"
arch=("x86_64")
url="https://github.com/securego/gosec"
license=("Apache")
source=("https://github.com/securego/gosec/releases/download/v${pkgver}/gosec_${pkgver}_linux_amd64.tar.gz")
b2sums=('e0f987c35513f7430df21022913694f646ad654950c4a89926e2b7b707ff0291793c9fecdce1eacedf1fb975f03ffc8490ef4c28f56be73bc03e90b672a8153c')

package() {
    install -Dm644 LICENSE.txt "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
    install -Dm755 gosec ${pkgdir}/usr/bin/gosec
}
