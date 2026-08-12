# Maintainer: Josephine Pfeiffer <hi@josie.lol>
# Contributor: Marcus Hoffmann <bubu@bubu1.eu>
# Contributor: Optize sp. z o.o. <hello@optize.pl>
pkgname=swagger-ui
pkgver=5.32.13
pkgrel=1
pkgdesc="Collection of web assets that dynamically generate documentation from a Swagger-compliant API"
arch=('any')
url='https://swagger.io/swagger-ui/'
license=('Apache-2.0')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/swagger-api/${pkgname}/archive/v${pkgver}.tar.gz")
sha256sums=('ab962ac25eb8c3224304c28c0964058348683d55a73afc5421d2db4f4f1456dd')

package() {
  cd "${pkgname}-${pkgver}"
  install -Dm644 -t "${pkgdir}/usr/share/webapps/${pkgname}" dist/*
}
