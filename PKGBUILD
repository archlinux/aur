# Maintainer: Hao Long <aur@esd.cc>

pkgname=gosec-bin
pkgver=2.9.2
pkgrel=1
pkgdesc="Inspects source code for security problems by scanning the Go AST"
arch=("x86_64")
url="https://github.com/securego/gosec"
license=("Apache")
source=("https://github.com/securego/gosec/releases/download/v${pkgver}/gosec_${pkgver}_linux_amd64.tar.gz")
b2sums=('02eb3115535b94e84577c324e761259d03d902f11371286a154898cf94a8dc63ab0082ec162b20f30b9e787508d15fbc11276b3c4e1622cb18498dd870b290ce')

package() {
    install -Dm644 LICENSE.txt "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
    install -Dm755 gosec ${pkgdir}/usr/bin/gosec
}
