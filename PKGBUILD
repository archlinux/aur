# Maintainer: Josephine Pfeiffer <hi@josie.lol>
# Former Maintainer: Marcus Hoffmann <bubu@bubu1.eu>
# Contributor: Optize sp. z o.o. <hello@optize.pl>

pkgname=swagger-ui
pkgver=5.20.5
pkgrel=1
pkgdesc="Collection of web assets that dynamically generate documentation from a Swagger-compliant API."
arch=('any')
url='https://swagger.io/swagger-ui/'
license=('Apache')
source=("https://github.com/swagger-api/${pkgname}/archive/v${pkgver}.tar.gz")
sha256sums=('51205eabaa387b3af2fa2981c34c98d32f0b3f8472d95e77af522906a82c1e84')

package() {
  cd "${srcdir}/${pkgname}-${pkgver}/dist"
  mkdir -p "${pkgdir}/usr/share/webapps/${pkgname}"
	cp -r * "${pkgdir}/usr/share/webapps/${pkgname}"
}
