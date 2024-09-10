# Maintainer: Hao Long <aur@esd.cc>

pkgname=gosec-bin
pkgver=2.21.2
pkgrel=1
pkgdesc="Inspects source code for security problems by scanning the Go AST"
arch=("x86_64")
url="https://github.com/securego/gosec"
license=("Apache")
source=("https://github.com/securego/gosec/releases/download/v${pkgver}/gosec_${pkgver}_linux_amd64.tar.gz")
b2sums=('bf0be135c9092871120a11890ac031209ed0471ef0bedf9fec33feb62aa55157980b7bfc1bae0ba2c0f5d4118819fe9fe3daef70728dfd4cfc3de2de635c3441')

package() {
    install -Dm644 LICENSE.txt "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
    install -Dm755 gosec ${pkgdir}/usr/bin/gosec
}
