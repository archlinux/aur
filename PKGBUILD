# Maintainer: Josephine Pfeiffer <hi@josie.lol>
# Former Maintainer: Marcus Hoffmann <bubu@bubu1.eu>
# Contributor: Optize sp. z o.o. <hello@optize.pl>

pkgname=swagger-ui
pkgver=5.29.5
pkgrel=1
pkgdesc="Collection of web assets that dynamically generate documentation from a Swagger-compliant API."
arch=('any')
url='https://swagger.io/swagger-ui/'
license=('Apache-2.0')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/swagger-api/${pkgname}/archive/v${pkgver}.tar.gz")
sha256sums=('1acd9b2b4dd75afe92c7f04b0c4c3f32b607029a788809920414e3c8f1a2caac')

package() {
  cd "${srcdir}/${pkgname}-${pkgver}/dist"
  mkdir -p "${pkgdir}/usr/share/webapps/${pkgname}"
	cp -r * "${pkgdir}/usr/share/webapps/${pkgname}"
}
