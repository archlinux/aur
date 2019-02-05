# Maintainer: Achilleas Koutsou (achilleas.k@gmail.com)

pkgname=gin-cli
pkgver=1.3
pkgrel=1
pkgdesc='Command line client for the G-Node Infrastructure (GIN) services'
arch=('x86_64')
url='https://gin.g-node.org'
license=('BSD')
depends=('git-annex' 'openssh')
install=${pkgname}.install
sha512sums=('252c4234fca91f0eff47ce7b79f2909c92b52911528ad44606f0306861fdc84916844b75ef4cb983846608e7ff28c6b87aafe770704db4831ac2945ae3c4577c')
source=("https://github.com/G-Node/gin-cli/releases/download/v${pkgver}/gin-cli-${pkgver}-linux-amd64.tar.gz")
package() {
    install -Dm755 "${srcdir}"/gin "${pkgdir}"/usr/bin/gin
}
