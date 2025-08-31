# Maintainer: Hao Long <aur@esd.cc>

pkgname=gosec-bin
pkgver=2.22.8
pkgrel=1
pkgdesc="Inspects source code for security problems by scanning the Go AST"
arch=("x86_64")
url="https://github.com/securego/gosec"
license=("Apache")
source=("https://github.com/securego/gosec/releases/download/v${pkgver}/gosec_${pkgver}_linux_amd64.tar.gz")
b2sums=('72cd811db9316479392662630155d17b2050c33a23ad2c7b1f800630088e54d04eaab61986a74d8c9664c38520a5a2c2885ff5ee2f534f1a7b7e555bb275f37c')

package() {
    install -Dm644 LICENSE.txt "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
    install -Dm755 gosec ${pkgdir}/usr/bin/gosec
}
