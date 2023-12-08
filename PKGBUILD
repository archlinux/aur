# Maintainer: Joan Figueras <ffigue at gmail dot com>

pkgname=guacamole-auth-duo-bin
pkgver=1.5.4
pkgrel=1
pkgdesc="The Duo authentication extension for Guacamole Client"
arch=('any')
url="https://guacamole.apache.org/"
license=('GPL3')
depends=('guacamole-client')
source=("https://archive.apache.org/dist/guacamole/${pkgver}/binary/guacamole-auth-duo-${pkgver}.tar.gz")

md5sums=('7c4d94236b262c0836a44caa74e175f7')

package() {
  cd "${srcdir}/guacamole-auth-duo-${pkgver}"
  mkdir -p "${pkgdir}"/etc/guacamole/extensions
  install -m 644 -D guacamole-auth-duo-${pkgver}.jar "${pkgdir}"/etc/guacamole/extensions/
}
