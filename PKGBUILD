# Maintainer: Josephine Pfeiffer <hi@josie.lol>
# Contributor: Marcus Hoffmann <bubu@bubu1.eu>
# Contributor: Optize sp. z o.o. <hello@optize.pl>
pkgname=swagger-ui
pkgver=5.32.11
pkgrel=1
pkgdesc="Collection of web assets that dynamically generate documentation from a Swagger-compliant API"
arch=('any')
url='https://swagger.io/swagger-ui/'
license=('Apache-2.0')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/swagger-api/${pkgname}/archive/v${pkgver}.tar.gz")
sha256sums=('5204ff52c7c8693eb80d564d4ba3739aed5d3919e45d641f91f91cefae69ef38')

package() {
  cd "${pkgname}-${pkgver}"
  install -Dm644 -t "${pkgdir}/usr/share/webapps/${pkgname}" dist/*
}
