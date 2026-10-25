# Maintainer: Hao Long <aur@esd.cc>

pkgname=gosec-bin
pkgver=2.30.0
pkgrel=1
pkgdesc="Inspects source code for security problems by scanning the Go AST"
arch=("x86_64")
url="https://github.com/securego/gosec"
license=("Apache")
source=("https://github.com/securego/gosec/releases/download/v${pkgver}/gosec_${pkgver}_linux_amd64.tar.gz")
b2sums=('b4427248d08f00a9b320bcc228fc0b4e0b6b9a394dba786e352cb18cb51b9503ccaba04417fff9e6f74156bc04e9c4aaa8f68dd83e516d9dfa7a1ac6ae4a3f41')

package() {
    install -Dm644 LICENSE.txt "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
    install -Dm755 gosec ${pkgdir}/usr/bin/gosec
}
