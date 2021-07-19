# Contributor: Robert Knauer <robert@privatdemail.net>
# Contributor: realitygaps <realitygaps AT yahoo DOT com>

pkgname=collabtive
pkgver=3.1
pkgrel=1
pkgfilever=31
pkgdesc="cloud based groupware, easy and efficient for your projects"
arch=('i686' 'x86_64')
url="http://collabtive.o-dyn.de/"
license=('GPL')
depends=('php')
source=("http://downloads.sourceforge.net/project/${pkgname}/${pkgname}/${pkgver}/${pkgname}-${pkgfilever}.zip")
sha256sums=('f29e65713090c6591cde6980956a14962d7193994a0c4b2bbc779fda2aa1fc94')

package() {
  mkdir -p "${pkgdir}/usr/share/webapps/${pkgname}"
  cp -r "${srcdir}/"* "${pkgdir}/usr/share/webapps/${pkgname}"
}
