# Maintainer: Hao Long <aur@esd.cc>

pkgname=gosec-bin
pkgver=2.9.1
pkgrel=1
pkgdesc="Inspects source code for security problems by scanning the Go AST"
arch=("x86_64")
url="https://github.com/securego/gosec"
license=("Apache")
source=("https://github.com/securego/gosec/releases/download/v${pkgver}/gosec_${pkgver}_linux_amd64.tar.gz")
b2sums=('db4e87263474b6d954f67b5b5d29dcf28e2b01174c50f009113e74e550f8dcd28205fef19e88fa5a91e3460977e0a2a599587161c4b585cb278c8bb584a3c6b0')

package() {
    install -Dm644 LICENSE.txt "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
    install -Dm755 gosec ${pkgdir}/usr/bin/gosec
}
