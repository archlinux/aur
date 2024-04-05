# Maintainer: Joan Figueras <ffigue at gmail dot com>

pkgname=guacamole-auth-totp-bin
pkgver=1.5.5
pkgrel=1
pkgdesc="The totp authentication extension for Guacamole Client"
arch=('any')
url="https://guacamole.apache.org/"
license=('GPL3')
depends=('guacamole-client')
source=("https://archive.apache.org/dist/guacamole/${pkgver}/binary/guacamole-auth-totp-${pkgver}.tar.gz")

md5sums=('f60e6108e0b16f9e2c80206559b7a692')

package() {
  cd "${srcdir}/guacamole-auth-totp-${pkgver}"
  mkdir -p "${pkgdir}"/etc/guacamole/extensions
  install -m 644 -D guacamole-auth-totp-${pkgver}.jar "${pkgdir}"/etc/guacamole/extensions/
}
