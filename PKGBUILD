# Maintainer: Hao Long <aur@esd.cc>

pkgname=gosec-bin
pkgver=2.1.0
pkgrel=1
pkgdesc="Inspects source code for security problems by scanning the Go AST"
arch=("x86_64")
url="https://github.com/securego/gosec"
license=("Apache")
source=("https://github.com/securego/gosec/releases/download/v${pkgver}/gosec_${pkgver}_linux_amd64.tar.gz")
sha256sums=('9b6e0b71b86cc79844e4c519b6d3c73701d2b71f4fd80f3b97aad93af7cb0b0e')

package() {
    install -Dm644 LICENSE.txt "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
    install -Dm755 gosec ${pkgdir}/usr/bin/gosec
}
