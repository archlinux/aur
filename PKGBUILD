# Maintainer: Marcus Hoffmann <bubu@bubu1.eu>
# Contributor: Optize sp. z o.o. <hello@optize.pl>

pkgname=swagger-ui
pkgver=3.48.0
pkgrel=1
pkgdesc='Collection of web assets that dynamically generate beautiful documentation from a Swagger-compliant API.'
arch=('any')
url='https://swagger.io/swagger-ui/'
license=('Apache')
source=("https://github.com/swagger-api/${pkgname}/archive/v${pkgver}.tar.gz")
sha256sums=('ca6e2e96f0844fc0da4041a73071a526809951b59e3555595d4e2c9740508c1b')

package() {
  cd "${srcdir}/${pkgname}-${pkgver}/dist"
  mkdir -p "${pkgdir}/usr/share/webapps/${pkgname}"
	cp -r * "${pkgdir}/usr/share/webapps/${pkgname}"
}
