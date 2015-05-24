# Maintainer: Victor Dmitriyev <mrvvitek@gmail.com>

pkgname=saxon6
pkgver=6.5.5
pkgrel=1
pkgdesc="XSLT 1.0 / XPath 1.0 processor for Java"
url="http://saxon.sourceforge.net/"
license=('MPL')
arch=('any')
depends=('java-runtime')
source=("http://sourceforge.net/projects/saxon/files/saxon6/6.5.5/saxon6-5-5.zip")
md5sums=('e913002af9c6bbb4c4361ff41baac3af')

package() {
  cd "${pkgdir}"
  install -dm755 "usr/share/java/saxon6"

  cd "${srcdir}"
  install -Dm644 "saxon.jar" "${pkgdir}/usr/share/java/saxon6/saxon.jar"
  install -Dm644 "saxon-jdom.jar" "${pkgdir}/usr/share/java/saxon6/saxon-jdom.jar"
  install -Dm644 "saxon-xml-apis.jar" "${pkgdir}/usr/share/java/saxon6/saxon-xml-apis.jar"
}

# vim:set ts=2 sw=2 et:
