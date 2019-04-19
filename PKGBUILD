pkgname=lazy-git
pkgver=0.5
pkgrel=1
pkgdesc="Git plugin suite for lazy developers"
arch=('any')
license=('BSD')
depends=('git')
makedepends=('stack')
source=('https://github.com/jbernsie/lazy-git/archive/v0.5.tar.gz')
md5sums=('2013e20bc4a7d656b68c0f4ed98f3c9e')

_distname="lazy-git"
_distdir="$_distname-$pkgver"
url="https://github.com/jbernsie/lazy-git"

build() {
  cd "$srcdir/$_distdir"
  make build
}

package() {
  cd "$srcdir/$_distdir"
  make DESTDIR="$pkgdir" install
}
