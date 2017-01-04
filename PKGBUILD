# Maintainer: Jose Riha < jose 1711 gmail com >

pkgname=pymakr_ide
pkgver=1.0.0b8
pkgrel=1
pkgdesc="Pymakr IDE for WiPy IOT boards"
url="https://www.pycom.io/"
license=('unknown')
arch=('any')
depends=('python2' 'python2-qscintilla-qt4')
source=('https://software.pycom.io/findupgrade?product=pymakr&type=all&platform=rpm&redirect=true')
md5sums=('ff09554fd058e75628702d86655cc39f')
 
package() {
  cd $srcdir
  cp -r usr $pkgdir/
}
