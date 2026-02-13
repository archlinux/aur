# Maintainer: Hao Long <aur@esd.cc>

pkgname=gosec-bin
pkgver=2.23.0
pkgrel=1
pkgdesc="Inspects source code for security problems by scanning the Go AST"
arch=("x86_64")
url="https://github.com/securego/gosec"
license=("Apache")
source=("https://github.com/securego/gosec/releases/download/v${pkgver}/gosec_${pkgver}_linux_amd64.tar.gz")
b2sums=('d5642d586a9532ae412db085289daafe48e156f46abb9a5708bbdf68301d34ad9d55b98d539ed5928035a2dda138fed64208639c460e2a685220a745d7a109e1')

package() {
    install -Dm644 LICENSE.txt "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
    install -Dm755 gosec ${pkgdir}/usr/bin/gosec
}
