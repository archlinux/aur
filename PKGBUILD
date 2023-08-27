# Maintainer: Hao Long <aur@esd.cc>

pkgname=gosec-bin
pkgver=2.17.0
pkgrel=1
pkgdesc="Inspects source code for security problems by scanning the Go AST"
arch=("x86_64")
url="https://github.com/securego/gosec"
license=("Apache")
source=("https://github.com/securego/gosec/releases/download/v${pkgver}/gosec_${pkgver}_linux_amd64.tar.gz")
b2sums=('9c169eae56d855fecdd95e8fc96da604dc1e05efea5dc16ecc6a9f168ecec24bf4ea521f942728ac16d3976024848a9ce02f86ff3620729fe8490de9cf117fa0')

package() {
    install -Dm644 LICENSE.txt "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
    install -Dm755 gosec ${pkgdir}/usr/bin/gosec
}
