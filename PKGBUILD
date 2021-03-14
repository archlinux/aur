# Maintainer: Marcus Hoffmann <bubu@bubu1.eu>
# Contributor: Optize sp. z o.o. <hello@optize.pl>

pkgname=swagger-ui
pkgver=3.45.0
pkgrel=1
pkgdesc='Collection of web assets that dynamically generate beautiful documentation from a Swagger-compliant API.'
arch=('any')
url='https://swagger.io/swagger-ui/'
license=('Apache')
source=("https://github.com/swagger-api/${pkgname}/archive/v${pkgver}.tar.gz")
sha256sums=('707134dca5bb407574560baabf49bade91cf106c37e9db348a2fba51fb2d6f85')

package() {
  cd "${srcdir}/${pkgname}-${pkgver}/dist"
  mkdir -p "${pkgdir}/usr/share/webapps/${pkgname}"
	cp -r * "${pkgdir}/usr/share/webapps/${pkgname}"
}
