# Maintainer: Rubin Simons <me@rubin55.org>

pkgname=prettier-plugin-java
pkgver=2.11.0
pkgrel=1
pkgdesc='Prettier Java Plugin'
arch=(any)
url=https://github.com/jhipster/prettier-java
license=(Apache-2.0)
depends=(prettier nodejs)
makedepends=(npm)
source=("https://registry.npmjs.org/${pkgname}/-/${pkgname}-${pkgver}.tgz")
noextract=("${pkgname}-${pkgver}.tgz")
sha256sums=('8948889699f98f6364513d2e6e7bcf4c9ff14b1a52f5c72dfef4344cbda784ff')

package() {
    npm install -g --prefix "${pkgdir}/usr" --cache "${srcdir}/npm-cache" \
        --legacy-peer-deps \
        "${srcdir}/${pkgname}-${pkgver}.tgz"
}
