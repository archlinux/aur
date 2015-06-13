# Maintainer: Albert Graef <aggraef at gmail.com>
# Contributor: Bjoern Lindig <bjoern dot lindig at googlemail dot com>

pkgname=pure-docs
pkgver=0.64
pkgrel=1
pkgdesc="Pure Language and Library Documentation"
arch=('any')
url="http://purelang.bitbucket.org/"
license=('FDL')
groups=(pure-complete pure-base)
source=(https://bitbucket.org/purelang/pure-lang/downloads/$pkgname-$pkgver.tar.gz)
md5sums=('b1ec4450cdcbc5af67105b16fc8b0531')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  make 
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make DESTDIR="$pkgdir" install install-tm
}

# vim:set ts=2 sw=2 et:
