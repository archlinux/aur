# Maintainer: Marcus Hoffmann <bubu@bubu1.eu>
# Contributor: Optize sp. z o.o. <hello@optize.pl>

pkgname=swagger-ui
pkgver=4.1.3
pkgrel=1
pkgdesc='Collection of web assets that dynamically generate beautiful documentation from a Swagger-compliant API.'
arch=('any')
url='https://swagger.io/swagger-ui/'
license=('Apache')
source=("https://github.com/swagger-api/${pkgname}/archive/v${pkgver}.tar.gz")
sha256sums=('c0665e4a6982b7d342d39d8d2582578045921d8aea32d84795f77286349ce3b2')

package() {
  cd "${srcdir}/${pkgname}-${pkgver}/dist"
  mkdir -p "${pkgdir}/usr/share/webapps/${pkgname}"
	cp -r * "${pkgdir}/usr/share/webapps/${pkgname}"
}
