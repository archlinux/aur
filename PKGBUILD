# Maintainer: Rubin Simons <me@rubin55.org>

pkgname=prettier-plugin-java
pkgver=2.12.0
pkgrel=1
pkgdesc='Prettier Java Plugin'
arch=(any)
url=https://github.com/jhipster/prettier-java
license=(Apache-2.0)
depends=(prettier nodejs)
makedepends=(npm)
source=("https://registry.npmjs.org/${pkgname}/-/${pkgname}-${pkgver}.tgz")
noextract=("${pkgname}-${pkgver}.tgz")
sha256sums=('40735b09f9b082f8e63e9789977e42968ef96075a0e064a65c3e0047d97beffa')

package() {
    npm install -g --prefix "${pkgdir}/usr" --cache "${srcdir}/npm-cache" \
        --legacy-peer-deps \
        "${srcdir}/${pkgname}-${pkgver}.tgz"
}
