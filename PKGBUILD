# Maintainer: Hao Long <aur@esd.cc>

pkgname=gosec-bin
pkgver=2.9.5
pkgrel=1
pkgdesc="Inspects source code for security problems by scanning the Go AST"
arch=("x86_64")
url="https://github.com/securego/gosec"
license=("Apache")
source=("https://github.com/securego/gosec/releases/download/v${pkgver}/gosec_${pkgver}_linux_amd64.tar.gz")
b2sums=('ecb1d34fe2f5179e709cd6a3c3bf858cd0d46ab80b380223a9b83a317ecf5a21dee757dc1f69aa96d7ceb5858a8421ae39bc997a9170e53f8f68a2aa092678a9')

package() {
    install -Dm644 LICENSE.txt "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
    install -Dm755 gosec ${pkgdir}/usr/bin/gosec
}
