# Maintainer: Albert Graef <aggraef@gmail.com>

pkgname=pure-gplot
pkgver=0.1
pkgrel=1
pkgdesc="gnuplot interface for the Pure programming language"
arch=('any')
license=('GPL3')
url="http://purelang.bitbucket.org/"
depends=('pure' 'gnuplot')
makedepends=()
groups=(pure-complete pure-math)
source=("https://bitbucket.org/purelang/pure-lang/downloads/$pkgname-$pkgver.tar.gz")
md5sums=('d7202235fd6e90d527aeb13733a0b100')

build() {
  cd $srcdir/$pkgname-$pkgver
}

package() {
  cd $srcdir/$pkgname-$pkgver
  make DESTDIR=$pkgdir install
}
