# Maintainer: Hao Long <aur@esd.cc>

pkgname=gosec-bin
pkgver=2.11.0
pkgrel=1
pkgdesc="Inspects source code for security problems by scanning the Go AST"
arch=("x86_64")
url="https://github.com/securego/gosec"
license=("Apache")
source=("https://github.com/securego/gosec/releases/download/v${pkgver}/gosec_${pkgver}_linux_amd64.tar.gz")
b2sums=('8d081d0369334de5a979508e6b407e01e575e1e61cd8069dcc5b735ff2265ce2183cb12eddab8ecb7ffa7cf018e210c58faed94b5e744f4ef2ccdd304a58af1d')

package() {
    install -Dm644 LICENSE.txt "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
    install -Dm755 gosec ${pkgdir}/usr/bin/gosec
}
