# Maintainer: Josephine Pfeiffer <hi@josie.lol>
# Former Maintainer: Marcus Hoffmann <bubu@bubu1.eu>
# Contributor: Optize sp. z o.o. <hello@optize.pl>

pkgname=swagger-ui
pkgver=5.24.1
pkgrel=1
pkgdesc="Collection of web assets that dynamically generate documentation from a Swagger-compliant API."
arch=('any')
url='https://swagger.io/swagger-ui/'
license=('Apache-2.0')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/swagger-api/${pkgname}/archive/v${pkgver}.tar.gz")
sha256sums=('5ccb2e959b3e0be82675eb697f81aa5da7ee5dfd9584395d75feab2e4748cdec')

package() {
  cd "${srcdir}/${pkgname}-${pkgver}/dist"
  mkdir -p "${pkgdir}/usr/share/webapps/${pkgname}"
	cp -r * "${pkgdir}/usr/share/webapps/${pkgname}"
}
