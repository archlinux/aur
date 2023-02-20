# Maintainer: Joan Figueras <ffigue at gmail dot com>

pkgname=guacamole-auth-json-bin
pkgver=1.5.0
pkgrel=1
pkgdesc="The json authentication extension for Guacamole Client"
arch=('any')
url="https://guacamole.apache.org/"
license=('GPL3')
depends=('guacamole-client')
source=("https://archive.apache.org/dist/guacamole/${pkgver}/binary/guacamole-auth-json-${pkgver}.tar.gz")

md5sums=('f48b0f85eed5143b2d41ab94d4d60239')

package() {
  cd "${srcdir}/guacamole-auth-json-${pkgver}"
  mkdir -p "${pkgdir}"/etc/guacamole/extensions
  install -m 644 -D guacamole-auth-json-${pkgver}.jar "${pkgdir}"/etc/guacamole/extensions/
}
