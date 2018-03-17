# Maintainer: Albert Graef <aggraef at gmail.com>
# Contributor: Bjoern Lindig <bjoern dot lindig at googlemail dot com>

pkgname=pure-docs
pkgver=0.66
pkgrel=1
pkgdesc="Pure Language and Library Documentation"
arch=('any')
url="http://purelang.bitbucket.org/"
license=('FDL')
groups=(pure-complete pure-base)
source=(https://bitbucket.org/purelang/pure-lang/downloads/$pkgname-$pkgver.tar.gz)
md5sums=('359f39d328a18e790a8352e94e5ade2a')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  make -j1
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make -j1 DESTDIR="$pkgdir" install install-tm
}

# vim:set ts=2 sw=2 et:
