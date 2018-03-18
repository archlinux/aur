# Maintainer: Albert Graef <aggraef at gmail.com>
# Contributor: Bjoern Lindig <bjoern dot lindig at googlemail dot com>

pkgname=pure-docs
pkgver=0.67
pkgrel=1
pkgdesc="Pure Language and Library Documentation"
arch=('any')
url="http://purelang.bitbucket.org/"
license=('FDL')
groups=(pure-complete pure-base)
source=(https://github.com/agraef/pure-lang/releases/download/pure-$pkgver/$pkgname-$pkgver.tar.gz)
md5sums=('ad49192a36b8463fdadf1c3532a7a627')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  make -j1
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make -j1 DESTDIR="$pkgdir" install install-tm
}

# vim:set ts=2 sw=2 et:
