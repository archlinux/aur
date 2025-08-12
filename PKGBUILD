# Maintainer: Hao Long <aur@esd.cc>

pkgname=gosec-bin
pkgver=2.22.7
pkgrel=1
pkgdesc="Inspects source code for security problems by scanning the Go AST"
arch=("x86_64")
url="https://github.com/securego/gosec"
license=("Apache")
source=("https://github.com/securego/gosec/releases/download/v${pkgver}/gosec_${pkgver}_linux_amd64.tar.gz")
b2sums=('04cbbc9332421687b27ff92f656c9219b7420bf4f708feabb69a74d45e396dde0f87de96f184aaf726cd6e80171042a8fb23dd43b125886fe5d51a952bdf68f3')

package() {
    install -Dm644 LICENSE.txt "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
    install -Dm755 gosec ${pkgdir}/usr/bin/gosec
}
