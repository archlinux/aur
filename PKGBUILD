# Maintainer: Marcus Hoffmann <bubu@bubu1.eu>
# Contributor: Optize sp. z o.o. <hello@optize.pl>

pkgname=swagger-ui
pkgver=3.51.1
pkgrel=1
pkgdesc='Collection of web assets that dynamically generate beautiful documentation from a Swagger-compliant API.'
arch=('any')
url='https://swagger.io/swagger-ui/'
license=('Apache')
source=("https://github.com/swagger-api/${pkgname}/archive/v${pkgver}.tar.gz")
sha256sums=('84d45edb7c87c77b72d9c33f7cb00ee2378df6e4054737e3c102ae7a33d17d49')

package() {
  cd "${srcdir}/${pkgname}-${pkgver}/dist"
  mkdir -p "${pkgdir}/usr/share/webapps/${pkgname}"
	cp -r * "${pkgdir}/usr/share/webapps/${pkgname}"
}
