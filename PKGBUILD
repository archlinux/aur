# Maintainer: Hao Long <aur@esd.cc>

pkgname=gosec-bin
pkgver=2.25.0
pkgrel=1
pkgdesc="Inspects source code for security problems by scanning the Go AST"
arch=("x86_64")
url="https://github.com/securego/gosec"
license=("Apache")
source=("https://github.com/securego/gosec/releases/download/v${pkgver}/gosec_${pkgver}_linux_amd64.tar.gz")
b2sums=('e42f1ac63eaad6afa0c1df038930a47f9047e198aeaf0ab543b44071a737c63022177fb9d378078b1c61f74384592c12309f1d9970b93fedfb5018b693c6460e')

package() {
    install -Dm644 LICENSE.txt "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
    install -Dm755 gosec ${pkgdir}/usr/bin/gosec
}
