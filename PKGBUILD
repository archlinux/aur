# Maintainer: Victor Dmitriyev <mrvvitek@gmail.com>

pkgname=iso-relax
pkgver=20041111
pkgrel=2
pkgdesc="Schema language neutral interface for XML document validators"
arch=('any')
url="http://iso-relax.sourceforge.net/"
license=('MIT')
depends=('java-runtime')
source=("https://sourceforge.net/projects/iso-relax/files/package/2004_11_11/isorelax.20041111.zip")
md5sums=('10381903828d30e36252910679fcbab6')
sha1sums=('259e4535d4c84e38ea08e1ea3431ec1bda679874')
sha256sums=('2fce4a64611737ecd52d5a5b816f572722602b62d2851b74279e7ccc2fab1476')

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
