# Maintainer: Joan Figueras <ffigue at gmail dot com>

pkgname=guacamole-auth-ldap-bin
pkgver=1.5.5
pkgrel=1
pkgdesc="The ldap authentication extension for Guacamole Client"
arch=('any')
url="https://guacamole.apache.org/"
license=('GPL3')
depends=('guacamole-client')
source=("https://archive.apache.org/dist/guacamole/${pkgver}/binary/guacamole-auth-ldap-${pkgver}.tar.gz")

md5sums=('1c30c06ab810fa671370ba8346d82a9f')

package() {
  cd "${srcdir}/guacamole-auth-ldap-${pkgver}"
  mkdir -p "${pkgdir}"/etc/guacamole/extensions
  install -m 644 -D guacamole-auth-ldap-${pkgver}.jar "${pkgdir}"/etc/guacamole/extensions/
}
