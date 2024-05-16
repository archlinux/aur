# Maintainer: Hao Long <aur@esd.cc>

pkgname=gosec-bin
pkgver=2.20.0
pkgrel=1
pkgdesc="Inspects source code for security problems by scanning the Go AST"
arch=("x86_64")
url="https://github.com/securego/gosec"
license=("Apache")
source=("https://github.com/securego/gosec/releases/download/v${pkgver}/gosec_${pkgver}_linux_amd64.tar.gz")
b2sums=('7158d016492082c157b368e6ce115918353c357e8d002526b3d20ac7c83c0c835b9726582b91583510c0ab85411cf816ae8571a3d32aa5479e4613cc8adc51aa')

package() {
    install -Dm644 LICENSE.txt "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
    install -Dm755 gosec ${pkgdir}/usr/bin/gosec
}
