# Maintainer: Hao Long <aur@esd.cc>

pkgname=gosec-bin
pkgver=2.19.0
pkgrel=1
pkgdesc="Inspects source code for security problems by scanning the Go AST"
arch=("x86_64")
url="https://github.com/securego/gosec"
license=("Apache")
source=("https://github.com/securego/gosec/releases/download/v${pkgver}/gosec_${pkgver}_linux_amd64.tar.gz")
b2sums=('d2681185d4135aa8213e2244a8c799dc8a08efe1114d34d7c485beaf9420b1ff192da353f91eb7c41a83f159ad57964aef8f4d104a1a03dbf01322b83beba2e4')

package() {
    install -Dm644 LICENSE.txt "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
    install -Dm755 gosec ${pkgdir}/usr/bin/gosec
}
