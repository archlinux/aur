# Maintainer: Robert Knauer <robert@privatdemail.net>
# Contributor: realitygaps <realitygaps AT yahoo DOT com>

pkgname=collabtive
pkgver=2.1.1
pkgrel=1
pkgfilever=211
pkgdesc="cloud based groupware, easy and efficient for your projects"
arch=('i686' 'x86_64')
url="http://collabtive.o-dyn.de/"
license=('GPL')
depends=('php')
source=("http://downloads.sourceforge.net/project/${pkgname}/${pkgname}/${pkgver}/${pkgname}-${pkgfilever}.zip")
sha256sums=('f92cb787e20542e335a9be0597f4df31ce05548959bad2deffc95421d6db53f9')

package() {
  mkdir -p "${pkgdir}/usr/share/webapps/${pkgname}"
  cp -r "${srcdir}/"* "${pkgdir}/usr/share/webapps/${pkgname}"
}
