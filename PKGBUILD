# Contributor: kalio <okalio@gmx.com>

pkgname=kurso_esperanto
pkgver=4.1.2
pkgrel=4
pkgdesc="A multimedia computer program for teaching yourself Esperanto"
url="http://kurso.com.br"
license=('GPL3')
arch=('i686' 'x86_64')
depends=('qt4' 'phonon' 'phonon-qt4-gstreamer' 'libxext')
optdepends=()
source_i686=('http://kurso.com.br/kurso.i386.tar.gz')
source_x86_64=('http://kurso.com.br/kurso.amd64.tar.gz')
md5sums_i686=('fa580797b4fb2ee34b30dccc79fb4b8d')
md5sums_x86_64=('6ffdff9b6bb742e813093a93678926d5')

package() {
  cd $srcdir/kurso-de-esperanto-4
  mkdir -p $pkgdir/usr/share/kurso
  mkdir -p $pkgdir/usr/bin
  
  cp -r sonoj $pkgdir/usr/share/kurso
  cp -r tradukoj $pkgdir/usr/share/kurso
  cp -r video $pkgdir/usr/share/kurso
  cp kurso4 $pkgdir/usr/share/kurso
  ln -s -r $pkgdir/usr/share/kurso/kurso4 $pkgdir/usr/bin/kurso

}
