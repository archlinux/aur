# Maintainer: Victor Dmitriyev <mrvvitek@gmail.com>

pkgname=scirenderer
pkgver=1.1.0
pkgrel=1
pkgdesc='A rendering library based on JoGL'
arch=('any')
url="http://forge.scilab.org/index.php/p/scirenderer/"
license=('custom:CeCILL')
depends=('java-runtime' 'jogl')
source=('COPYING'
	"http://forge.scilab.org/index.php/p/scirenderer/downloads/get/${pkgname}-${pkgver}.jar")
noextract=("${pkgname}-${pkgver}.jar")
md5sums=('2d740db2d9a00ce8e4d54d3ea8789b5a'
  '8b828d571156fe644a22052dca823668'
)

package() {
  cd "${srcdir}"
  install -Dm644 "${pkgname}-${pkgver}.jar" "${pkgdir}/usr/share/java/${pkgname}/${pkgname}.jar"
  install -Dm644 "COPYING" "${pkgdir}/usr/share/licenses/${pkgname}/COPYING"
}
# vim:set ts=2 sw=2 et:
