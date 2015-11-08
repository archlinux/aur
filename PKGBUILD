# Contributor: Joker-jar <joker-jar@yandex.ru>

#TODO: Place sourcecode to somewhere :)

pkgname=deadbeef-plugins-psipublish
pkgver=1.3
pkgrel=1
pkgdesc="Plugin for DeaDBeeF to publish tune in Psi/Psi+"
arch=('i686' 'x86_64')
url="http://psi-im.org/wiki/Publish_Tune"
license=('GPL2')
depends=('deadbeef')
makedepends=('deadbeef')
source=('psipublish.c')
md5sums=('cfab279f1c90cb0f31e833487e5dbc5b')

build() {
  cd $srcdir
  gcc -I/usr/include/deadbeef -std=c99 -shared -O2 -o psipublish.so psipublish.c -fPIC
  mkdir -p $pkgdir/usr/lib/deadbeef/
  cp psipublish.so $pkgdir/usr/lib/deadbeef/
}
