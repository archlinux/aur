# Maintainer: Muflone <muflone@vbsimple.net>
pkgname=tn5250j-plugin-jython
pkgver=2.5.3
pkgrel=1
pkgdesc="Support for Python scripting in tn5250j"
arch=(any)
url="http://www.jython.org/"
license=('GPL')
depends=(tn5250j jython)

package() {
  # Install files for the package
  install -d "$pkgdir/usr/share/java/tn5250j"
  ln -s "/opt/jython/jython.jar" "$pkgdir/usr/share/java/tn5250j/jython.jar"
}

