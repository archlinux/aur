# Maintainer: jose <jose1711 [at] gmail (dot) com>

pkgname=ocempgui
pkgver=0.2.9
pkgrel=1
pkgdesc="GUI engine for Pygame and more"
arch=('i686')
url="http://ocemp.sourceforge.net/"
license=("BSD")
depends=('python2' 'python2-pygame')
optdepends=('atk')
source=("http://sourceforge.net/projects/ocemp/files/ocempgui/0.2.9/OcempGUI-0.2.9.tar.gz/download")
md5sums=('433a49ec5bdc690d2fc11b0ad56b2749')

build() {
  :
}

package() {
  cd $srcdir/OcempGUI-0.2.9
  python2 setup.py install --root=$pkgdir --prefix=/usr
}
