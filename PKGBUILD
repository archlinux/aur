# Maintainer: Hao Long <aur@esd.cc>

pkgname=gosec-bin
pkgver=2.13.1
pkgrel=1
pkgdesc="Inspects source code for security problems by scanning the Go AST"
arch=("x86_64")
url="https://github.com/securego/gosec"
license=("Apache")
source=("https://github.com/securego/gosec/releases/download/v${pkgver}/gosec_${pkgver}_linux_amd64.tar.gz")
b2sums=('8c34a537172a0d88957a93895c66449722bb8527e192e96fd75b577dfc0dbd729c36f79bcc896e9899ce48a482ac68384fcf420b1dfaa91fb23968262590e0c2')

package() {
    install -Dm644 LICENSE.txt "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
    install -Dm755 gosec ${pkgdir}/usr/bin/gosec
}
