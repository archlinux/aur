# Maintainer: Hao Long <aur@esd.cc>

pkgname=gosec-bin
pkgver=2.5.0
pkgrel=1
pkgdesc="Inspects source code for security problems by scanning the Go AST"
arch=("x86_64")
url="https://github.com/securego/gosec"
license=("Apache")
source=("https://github.com/securego/gosec/releases/download/v${pkgver}/gosec_${pkgver}_linux_amd64.tar.gz")
sha256sums=('c7d13ddf58d3937939f97c9c33675e9fb1a8eb66ea0a7691ba1f432bfc9c18a4')

package() {
    install -Dm644 LICENSE.txt "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
    install -Dm755 gosec ${pkgdir}/usr/bin/gosec
}
