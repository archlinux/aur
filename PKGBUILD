# Maintainer: Hao Long <aur@esd.cc>

pkgname=gosec-bin
pkgver=2.12.0
pkgrel=1
pkgdesc="Inspects source code for security problems by scanning the Go AST"
arch=("x86_64")
url="https://github.com/securego/gosec"
license=("Apache")
source=("https://github.com/securego/gosec/releases/download/v${pkgver}/gosec_${pkgver}_linux_amd64.tar.gz")
b2sums=('db038da6463f3c648a2abd70d09cd84f8061afa6b8e6a8f2684f21837e619cb1c0e5e433137e23b65fef8e171a4ae3d0bac82a5dc14602b36153e5896a01ea3b')

package() {
    install -Dm644 LICENSE.txt "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
    install -Dm755 gosec ${pkgdir}/usr/bin/gosec
}
