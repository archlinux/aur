# Maintainer: Achilleas Koutsou (achilleas.k@gmail.com)

pkgname=gin-cli
pkgver=1.1
pkgrel=1
pkgdesc='Command line client for the G-Node Infrastructure (GIN) services'
arch=('x86_64')
url='https://gin.g-node.org'
license=('BSD')
depends=('git-annex' 'openssh')
install=${pkgname}.install
sha512sums=('c06eeab7a6883fc2a6f9947784200f97e6f76a006f01828836865ba87410ba3d5da6e1704a3830da0e207cff5ce6feb670a91e5f722e517a08503c691883b2e3')
source=("https://github.com/G-Node/gin-cli/releases/download/v${pkgver}/gin-cli-${pkgver}-linux-amd64.tar.gz")
package() {
    install -Dm755 "${srcdir}"/gin "${pkgdir}"/usr/bin/gin
}
