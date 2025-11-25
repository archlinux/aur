# Maintainer: Joan Figueras <ffigue at gmail dot com>

pkgname=guacamole-auth-duo-bin
pkgver=1.6.0
pkgrel=1
pkgdesc="The Duo authentication extension for Guacamole Client"
arch=('any')
url="https://guacamole.apache.org/"
license=('Apache-2.0')
depends=('guacamole-client')
source=("https://archive.apache.org/dist/guacamole/${pkgver}/binary/guacamole-auth-duo-${pkgver}.tar.gz")

md5sums=('31d84f9752aa6d7b1bc2f06235e551db')

package() {
  cd "${srcdir}/guacamole-auth-duo-${pkgver}"
  mkdir -p "${pkgdir}"/etc/guacamole/extensions
  install -m 644 -D guacamole-auth-duo-${pkgver}.jar "${pkgdir}"/etc/guacamole/extensions/
}
