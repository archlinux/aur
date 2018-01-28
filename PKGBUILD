# Maintainer: Jose Riha < jose 1711 gmail com >

pkgname=pymakr_ide
pkgver=1.0.0b8
pkgrel=3
pkgdesc="Pymakr IDE for WiPy IOT boards"
url="https://www.pycom.io/"
license=('unknown')
arch=('any')
depends=('python2' 'python2-qscintilla-qt4')
source=("http://software.pycom.io/downloads/pymakr_1.0.0.b8-1_all.deb")
md5sums=('d339903241b28220476b4fd6661c588e')
 
package() {
  cd $srcdir
  tar xJf data.tar.xz
  cp -r . $pkgdir/
  rm $pkgdir/data.tar.xz $pkgdir/control.tar.gz
  # ls $pkgdir
}
