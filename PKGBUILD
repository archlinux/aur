# Maintainer: Achilleas Koutsou (achilleas.k@gmail.com)

pkgname=gin-cli
pkgver=1.2
pkgrel=1
pkgdesc='Command line client for the G-Node Infrastructure (GIN) services'
arch=('x86_64')
url='https://gin.g-node.org'
license=('BSD')
depends=('git-annex' 'openssh')
install=${pkgname}.install
sha512sums=('d956d547c8e3192951280dc64a0a37f9ed058f292b8a5fc4a83851a76cbb20bd4d1452fc33ea88aa8d1afe82b9f069e3f881015e7ed1f8b567ab5194feee550b')
source=("https://github.com/G-Node/gin-cli/releases/download/v${pkgver}/gin-cli-${pkgver}-linux-amd64.tar.gz")
package() {
    install -Dm755 "${srcdir}"/gin "${pkgdir}"/usr/bin/gin
}
