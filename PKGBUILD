# Maintainer: Victor Dmitriyev <mrvvitek@gmail.com>

pkgname=iso-relax
pkgver=20041111
pkgrel=1
pkgdesc="Schema language neutral interface for XML document validators"
arch=('any')
url="http://iso-relax.sourceforge.net/"
license=('MIT')
depends=('java-runtime')
source=("http://sourceforge.net/projects/iso-relax/files/package/2004_11_11/isorelax.${pkgver}.zip")
md5sums=('10381903828d30e36252910679fcbab6')

package() {
  cd "${pkgdir}"
  install -dm755 "usr/share/java/${pkgname}"
  install -dm755 "usr/share/licenses/${pkgname}"
  cd "${srcdir}"
	install -Dm644 "isorelax.jar" \
    "${pkgdir}/usr/share/java/${pkgname}/isorelax.jar"
	install -Dm644 "COPYING.txt" \
    "${pkgdir}/usr/share/licenses/${pkgname}/license.txt"
}

# vim:set ts=2 sw=2 et:
