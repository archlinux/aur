# Maintainer: Joan Figueras <ffigue at gmail dot com>

pkgname=guacamole-auth-header-bin
pkgver=1.5.0
pkgrel=1
pkgdesc="The HTTP header authentication extension for Guacamole Client"
arch=('any')
url="https://guacamole.apache.org/"
license=('GPL3')
depends=('guacamole-client')
source=("https://archive.apache.org/dist/guacamole/${pkgver}/binary/guacamole-auth-header-${pkgver}.tar.gz")

md5sums=('ed5dec44ccdc4dc8dde772ec8b40fb2f')

package() {
  cd "${srcdir}/guacamole-auth-header-${pkgver}"
  mkdir -p "${pkgdir}"/etc/guacamole/extensions
  install -m 644 -D guacamole-auth-header-${pkgver}.jar "${pkgdir}"/etc/guacamole/extensions/
}
