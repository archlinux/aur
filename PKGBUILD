# Maintainer: Joan Figueras <ffigue at gmail dot com>

pkgname=guacamole-auth-header-bin
pkgver=1.6.0
pkgrel=1
pkgdesc="The HTTP header authentication extension for Guacamole Client"
arch=('any')
url="https://guacamole.apache.org/"
license=('Apache-2.0')
depends=('guacamole-client')
source=("https://archive.apache.org/dist/guacamole/${pkgver}/binary/guacamole-auth-header-${pkgver}.tar.gz")

md5sums=('9a0a02d340f44e67c830caa3bb4cb3dd')

package() {
  cd "${srcdir}/guacamole-auth-header-${pkgver}"
  mkdir -p "${pkgdir}"/etc/guacamole/extensions
  install -m 644 -D guacamole-auth-header-${pkgver}.jar "${pkgdir}"/etc/guacamole/extensions/
}
