# Maintainer: Hao Long <aur@esd.cc>

pkgname=gosec-bin
pkgver=2.9.6
pkgrel=1
pkgdesc="Inspects source code for security problems by scanning the Go AST"
arch=("x86_64")
url="https://github.com/securego/gosec"
license=("Apache")
source=("https://github.com/securego/gosec/releases/download/v${pkgver}/gosec_${pkgver}_linux_amd64.tar.gz")
b2sums=('d84d092e4e0e6a367dd9ddaf0b8e3a132843565f8c874df04818fabc42a4e67d2f5a0210a163854a03b34d9e53d2b0e48bb87367257b2c7a3d825df288a19ace')

package() {
    install -Dm644 LICENSE.txt "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
    install -Dm755 gosec ${pkgdir}/usr/bin/gosec
}
