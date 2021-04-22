# Maintainer: Victor Dmitriyev <mrvvitek@gmail.com>

pkgname=saxon6
pkgver=6.5.5
pkgrel=1
pkgdesc="XSLT 1.0 / XPath 1.0 processor for Java"
url="http://saxon.sourceforge.net/"
license=('MPL')
arch=('any')
depends=('java-runtime')
source=("https://sourceforge.net/projects/saxon/files/saxon6/6.5.5/saxon6-5-5.zip")
md5sums=('e913002af9c6bbb4c4361ff41baac3af')
sha1sums=('15e25fcf561ff173751ae992f2608f6f2e6204ed')
sha256sums=('a76806dda554edc844601d0ec0fb3d2a10a2f397eabf3569dfb44b628363afc4')
sha512sums=('2d76ab6da8fc8ca8502139f6b620d4c9e94732a520083480e3936f6bd0a9f069252a7a05df53dab49aabec505764b2ec4ca1b36022bb56df568883a0491f495a')

package() {
  cd "${pkgdir}"
  install -dm755 "usr/share/java/saxon6"

  cd "${srcdir}"
  install -Dm644 "saxon.jar" "${pkgdir}/usr/share/java/saxon6/saxon.jar"
  install -Dm644 "saxon-jdom.jar" "${pkgdir}/usr/share/java/saxon6/saxon-jdom.jar"
  install -Dm644 "saxon-xml-apis.jar" "${pkgdir}/usr/share/java/saxon6/saxon-xml-apis.jar"
}

# vim:set ts=2 sw=2 et:
