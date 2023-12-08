# Maintainer: Joan Figueras <ffigue at gmail dot com>

pkgname=guacamole-auth-totp-bin
pkgver=1.5.4
pkgrel=1
pkgdesc="The totp authentication extension for Guacamole Client"
arch=('any')
url="https://guacamole.apache.org/"
license=('GPL3')
depends=('guacamole-client')
source=("https://archive.apache.org/dist/guacamole/${pkgver}/binary/guacamole-auth-totp-${pkgver}.tar.gz")

md5sums=('f7359f50a6eabbe9accbd7dd7c97ff0b')

package() {
  cd "${srcdir}/guacamole-auth-totp-${pkgver}"
  mkdir -p "${pkgdir}"/etc/guacamole/extensions
  install -m 644 -D guacamole-auth-totp-${pkgver}.jar "${pkgdir}"/etc/guacamole/extensions/
}
