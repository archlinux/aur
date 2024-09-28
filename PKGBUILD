# Maintainer: Hao Long <aur@esd.cc>

pkgname=gosec-bin
pkgver=2.21.4
pkgrel=1
pkgdesc="Inspects source code for security problems by scanning the Go AST"
arch=("x86_64")
url="https://github.com/securego/gosec"
license=("Apache")
source=("https://github.com/securego/gosec/releases/download/v${pkgver}/gosec_${pkgver}_linux_amd64.tar.gz")
b2sums=('7be8a7af9ba54ac78f2f5cd710421b161920fb3619165089757f2d0db5791aa99069885b19a93ed895880c21ed57646a9bac67fc7938aab01b26a5d7923c5b3e')

package() {
    install -Dm644 LICENSE.txt "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
    install -Dm755 gosec ${pkgdir}/usr/bin/gosec
}
