# Maintainer: Hao Long <aur@esd.cc>

pkgname=gosec-bin
pkgver=2.14.0
pkgrel=1
pkgdesc="Inspects source code for security problems by scanning the Go AST"
arch=("x86_64")
url="https://github.com/securego/gosec"
license=("Apache")
source=("https://github.com/securego/gosec/releases/download/v${pkgver}/gosec_${pkgver}_linux_amd64.tar.gz")
b2sums=('6b73dff44dfa245c825b5c291b6d85fe464aece27ce7aa45b7c0cc27429e5c414c85a16dd3eb282787b81884b31496f80f41b5429eb730cf688dd53c13df9005')

package() {
    install -Dm644 LICENSE.txt "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
    install -Dm755 gosec ${pkgdir}/usr/bin/gosec
}
