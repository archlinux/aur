#Maintainer: Mikaela Suomalainen <mikaela@mikaela.info>
#Contributor: Simo Leone <neotuli@gmail.com>

pkgname=aspell-fi
pkgver=0.7
pkgrel=2
pkgdesc="Finnish dictionary for aspell"
arch=('any')
url="http://aspell.net"
license=('GPL2')
depends=('aspell')
source=(ftp://ftp.gnu.org/gnu/aspell/dict/fi/aspell6-fi-$pkgver-0.tar.bz2)
md5sums=('6d1032116982c0efab1af8fce83259c0')

build() {
  cd "$srcdir/aspell6-fi-$pkgver-0"
  ./configure
  make
}

package() {
  cd "$srcdir/aspell6-fi-$pkgver-0"
  make DESTDIR="$pkgdir" install
}
