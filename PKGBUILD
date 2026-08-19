# Maintainer: Josephine Pfeiffer <hi@josie.lol>
# Contributor: Marcus Hoffmann <bubu@bubu1.eu>
# Contributor: Optize sp. z o.o. <hello@optize.pl>
pkgname=swagger-ui
pkgver=5.32.14
pkgrel=1
pkgdesc="Collection of web assets that dynamically generate documentation from a Swagger-compliant API"
arch=('any')
url='https://swagger.io/swagger-ui/'
license=('Apache-2.0')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/swagger-api/${pkgname}/archive/v${pkgver}.tar.gz")
sha256sums=('2153238be830b086d7b20455e617e3fa0d6d899b8742f7aa3649381f1e2dc9d6')

package() {
  cd "${pkgname}-${pkgver}"
  install -Dm644 -t "${pkgdir}/usr/share/webapps/${pkgname}" dist/*
}
