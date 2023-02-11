# Maintainer: Hao Long <aur@esd.cc>

pkgname=gosec-bin
pkgver=2.15.0
pkgrel=1
pkgdesc="Inspects source code for security problems by scanning the Go AST"
arch=("x86_64")
url="https://github.com/securego/gosec"
license=("Apache")
source=("https://github.com/securego/gosec/releases/download/v${pkgver}/gosec_${pkgver}_linux_amd64.tar.gz")
b2sums=('716073983bc731ab89aa9f17fd32ae1fa9f310563844547018eb275db436630a91ff6608e8b67315d81e502ad77702241c55d053d70ff6d682b0ef0ca2ac1350')

package() {
    install -Dm644 LICENSE.txt "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
    install -Dm755 gosec ${pkgdir}/usr/bin/gosec
}
