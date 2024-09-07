# Maintainer: Hao Long <aur@esd.cc>

pkgname=gosec-bin
pkgver=2.21.1
pkgrel=1
pkgdesc="Inspects source code for security problems by scanning the Go AST"
arch=("x86_64")
url="https://github.com/securego/gosec"
license=("Apache")
source=("https://github.com/securego/gosec/releases/download/v${pkgver}/gosec_${pkgver}_linux_amd64.tar.gz")
b2sums=('d706e12f9b29e3615a13adb9797473ad9e667985d05742b51dd39b6df986c7ddcea5cfbf78f3ed2b2087b0d9a977b984776212ce7a363d8230d96826f5f37900')

package() {
    install -Dm644 LICENSE.txt "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
    install -Dm755 gosec ${pkgdir}/usr/bin/gosec
}
