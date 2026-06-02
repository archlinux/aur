# Maintainer: Hao Long <aur@esd.cc>

pkgname=gosec-bin
pkgver=2.27.1
pkgrel=1
pkgdesc="Inspects source code for security problems by scanning the Go AST"
arch=("x86_64")
url="https://github.com/securego/gosec"
license=("Apache")
source=("https://github.com/securego/gosec/releases/download/v${pkgver}/gosec_${pkgver}_linux_amd64.tar.gz")
b2sums=('15458c2ecd20a410c05d93e870faa513eef611d489625f19760a4ec943d4fb2fdc86b2be2afeace9e17864959f6f20e7ee4345e0ad66aa2b7a401461fef47bbc')

package() {
    install -Dm644 LICENSE.txt "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
    install -Dm755 gosec ${pkgdir}/usr/bin/gosec
}
