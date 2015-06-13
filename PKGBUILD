# Maintainer: Albert Graef <aggraef@gmail.com>
# Contributor: Bjoern Lindig bjoern dot lindig at googlemail dot com

pkgname=pure-faust
pkgver=0.11
pkgrel=1
pkgdesc="Run Faust-generated signal processing modules in Pure"
arch=("i686" "x86_64")
license=('LGPL3')
url="http://purelang.bitbucket.org/"
depends=('pure')
makedepends=('faust')
groups=(pure-complete pure-multimedia)
source=("https://bitbucket.org/purelang/pure-lang/downloads/$pkgname-$pkgver.tar.gz")
md5sums=('adaa4bba235b03bfc03dc4e1a0e079fe')

build() {
  cd $srcdir/$pkgname-$pkgver
  make
}

package() {
  cd $srcdir/$pkgname-$pkgver
  make DESTDIR=$pkgdir install
}
