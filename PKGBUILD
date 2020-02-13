# Maintainer: Achilleas Koutsou (achilleas.k@gmail.com)

pkgname=gin-cli
pkgver=1.10
pkgrel=1
pkgdesc='Command line client for the G-Node Infrastructure (GIN) services'
arch=('x86_64')
url='https://gin.g-node.org/G-Node/Info/wiki/GinCliSetup'
license=('BSD')
depends=('git-annex' 'openssh')
install=${pkgname}.install
sha512sums=('6de3e977f9197d2a7f1b21d72f00012a9e3add8cd5dd50803f188cea925e2c65584e9c988a8034ec41eb86c2c3d870fb1b4086f373283875f5d84c26e4739be1')
source=("https://github.com/G-Node/gin-cli/releases/download/v${pkgver}/gin-cli-${pkgver}-linux.tar.gz")
package() {
    install -Dm755 "${srcdir}"/gin "${pkgdir}"/usr/bin/gin
}
