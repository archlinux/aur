# Maintainer: Josephine Pfeiffer <hi@josie.lol>
# Former Maintainer: Marcus Hoffmann <bubu@bubu1.eu>
# Contributor: Optize sp. z o.o. <hello@optize.pl>

pkgname=swagger-ui
pkgver=5.31.1
pkgrel=1
pkgdesc="Collection of web assets that dynamically generate documentation from a Swagger-compliant API."
arch=('any')
url='https://swagger.io/swagger-ui/'
license=('Apache-2.0')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/swagger-api/${pkgname}/archive/v${pkgver}.tar.gz")
sha256sums=('5b577fcd6e4bd378131be998457d5182055203310a640796a3536c9f57c47f3f')

package() {
  cd "${srcdir}/${pkgname}-${pkgver}/dist"
  mkdir -p "${pkgdir}/usr/share/webapps/${pkgname}"
	cp -r * "${pkgdir}/usr/share/webapps/${pkgname}"
}
