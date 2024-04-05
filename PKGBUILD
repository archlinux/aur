# Maintainer: Joan Figueras <ffigue at gmail dot com>

pkgname=guacamole-auth-json-bin
pkgver=1.5.5
pkgrel=1
pkgdesc="The json authentication extension for Guacamole Client"
arch=('any')
url="https://guacamole.apache.org/"
license=('GPL3')
depends=('guacamole-client')
source=("https://archive.apache.org/dist/guacamole/${pkgver}/binary/guacamole-auth-json-${pkgver}.tar.gz")

md5sums=('a94fbbd252bbca05b20e9cfa24418496')

package() {
  cd "${srcdir}/guacamole-auth-json-${pkgver}"
  mkdir -p "${pkgdir}"/etc/guacamole/extensions
  install -m 644 -D guacamole-auth-json-${pkgver}.jar "${pkgdir}"/etc/guacamole/extensions/
}
