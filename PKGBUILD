# Contributor: rabyte <rabyte__gmail>

pkgname=fortune-mod-de
pkgver=1.0
pkgrel=2
pkgdesc="A collection of German fortune cookie files"
arch=('i686' 'x86_64')
url="http://www.mabelsoft.org/fortune_de_utf8.htm"
license=('GPL2')
depends=('fortune-mod')
source=(http://www.mabelsoft.org/pub/fortune_deutsch_utf8.tgz)
md5sums=('d603b87a3a593ae333bd48f646332528')

build() {
  cd $pkgdir

  mkdir -p usr/share
  cp -rf $srcdir/f/ usr/share/fortune/
}
