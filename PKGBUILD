# Maintainer: Hao Long <aur@esd.cc>

pkgname=gosec-bin
pkgver=2.22.9
pkgrel=1
pkgdesc="Inspects source code for security problems by scanning the Go AST"
arch=("x86_64")
url="https://github.com/securego/gosec"
license=("Apache")
source=("https://github.com/securego/gosec/releases/download/v${pkgver}/gosec_${pkgver}_linux_amd64.tar.gz")
b2sums=('ac290006590048dfcfb6e692cb1c31f3713113d61deb2af6afc99e7f92ae1c724f3735823ad4ad190f588b0c1b0e5885d7eacad20c81af96f1f784501889ec05')

package() {
    install -Dm644 LICENSE.txt "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
    install -Dm755 gosec ${pkgdir}/usr/bin/gosec
}
