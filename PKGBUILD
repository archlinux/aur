# Maintainer: Achilleas Koutsou (achilleas.k@gmail.com)

pkgname=gin-cli
pkgver=1.9
pkgrel=1
pkgdesc='Command line client for the G-Node Infrastructure (GIN) services'
arch=('x86_64')
url='https://gin.g-node.org/G-Node/Info/wiki/GinCliSetup'
license=('BSD')
depends=('git-annex' 'openssh')
install=${pkgname}.install
sha512sums=('06772abd55645bca1555a9aeaa6565d122c1e354268ba33e1758d9ff07ea524e7836f146710db0623989e368f9c25aa32b6783c4d5944f03f0cf790fdafaa926')
source=("https://github.com/G-Node/gin-cli/releases/download/v${pkgver}/gin-cli-${pkgver}-linux-amd64.tar.gz")
package() {
    install -Dm755 "${srcdir}"/gin "${pkgdir}"/usr/bin/gin
}
