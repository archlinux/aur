# Maintainer: Joan Figueras <ffigue at gmail dot com>

pkgname=guacamole-auth-duo-bin
pkgver=1.5.2
pkgrel=1
pkgdesc="The Duo authentication extension for Guacamole Client"
arch=('any')
url="https://guacamole.apache.org/"
license=('GPL3')
depends=('guacamole-client')
source=("https://archive.apache.org/dist/guacamole/${pkgver}/binary/guacamole-auth-duo-${pkgver}.tar.gz")

md5sums=('abf0af267ef0e63248d179199c2482e7')

package() {
  cd "${srcdir}/guacamole-auth-duo-${pkgver}"
  mkdir -p "${pkgdir}"/etc/guacamole/extensions
  install -m 644 -D guacamole-auth-duo-${pkgver}.jar "${pkgdir}"/etc/guacamole/extensions/
}
