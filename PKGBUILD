# Maintainer: Hao Long <aur@esd.cc>

pkgname=gosec-bin
pkgver=2.9.3
pkgrel=1
pkgdesc="Inspects source code for security problems by scanning the Go AST"
arch=("x86_64")
url="https://github.com/securego/gosec"
license=("Apache")
source=("https://github.com/securego/gosec/releases/download/v${pkgver}/gosec_${pkgver}_linux_amd64.tar.gz")
b2sums=('f8de6078cf9f73bc444d6ee9d23ab66cde241bde1c40cd2b97072b08f6e84484af3f40b1510da60c8e4138e34dd12899ac257bdacd3bd3dd55156497fca8ddd9')

package() {
    install -Dm644 LICENSE.txt "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
    install -Dm755 gosec ${pkgdir}/usr/bin/gosec
}
