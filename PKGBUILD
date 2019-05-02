pkgname=lazy-git
pkgver=0.6
pkgrel=1
pkgdesc="Git plugin suite for lazy developers"
arch=('any')
license=('BSD')
depends=('git')
makedepends=('stack')
source=('https://github.com/jbernsie/lazy-git/archive/0.7.tar.gz')
md5sums=('ded33503d8181e09b43b6ebbf0c46d28')

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
