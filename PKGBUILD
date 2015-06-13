# Maintainer: Muflone http://www.muflone.com/contacts/english/

pkgname=tn5250j-plugin-jtopen
pkgver=8.3
pkgrel=2
pkgdesc="Support for export of spool files and data files in tn5250j"
arch=('any')
url="http://jt400.sourceforge.net/"
license=('GPL')
depends=('tn5250j' 'libjtopen')

package() {
  # Install files for the package
  install -d "${pkgdir}/usr/share/java/tn5250j"
  ln -s /usr/lib/libjtopen/jt400.jar "${pkgdir}/usr/share/java/tn5250j/jt400.jar"
}

