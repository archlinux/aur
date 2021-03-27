# Maintainer: Achilleas Koutsou (achilleas.k@gmail.com)

pkgname=gin-cli
pkgver=1.12
pkgrel=1
pkgdesc='Command line client for the G-Node Infrastructure (GIN) services'
arch=('x86_64')
url='https://gin.g-node.org/G-Node/Info/wiki/GinCliSetup'
license=('BSD')
depends=('git-annex' 'openssh')
install=${pkgname}.install
sha512sums=('4c0d8e2eed94c5ecaa165d78a0c321867178b856c920dfe741c67286c8a49b673b87163c06b8490634e9de4d774111246f8a4e814cb1fc4d43ba1ab724f26743')
source=("https://github.com/G-Node/gin-cli/releases/download/v${pkgver}/gin-cli-${pkgver}-linux.tar.gz")
package() {
    install -Dm755 "${srcdir}"/gin "${pkgdir}"/usr/bin/gin
}
