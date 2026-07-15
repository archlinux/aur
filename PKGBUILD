# Maintainer: Hao Long <aur@esd.cc>

pkgname=gosec-bin
pkgver=2.28.0
pkgrel=1
pkgdesc="Inspects source code for security problems by scanning the Go AST"
arch=("x86_64")
url="https://github.com/securego/gosec"
license=("Apache")
source=("https://github.com/securego/gosec/releases/download/v${pkgver}/gosec_${pkgver}_linux_amd64.tar.gz")
b2sums=('4966cfea7e3d873adf0c0bfbc4b68854d3ce86ced2f03a57e9f73556323533bb408142c84c1999360c5e9ab37c47e2e3863d364e42332e25b5f2cd734e8bf8df')

package() {
    install -Dm644 LICENSE.txt "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
    install -Dm755 gosec ${pkgdir}/usr/bin/gosec
}
