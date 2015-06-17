# Maintainer: M0Rf30

pkgname=cons
pkgver=2.2.0
pkgrel=1
pkgdesc="A Perl replacement for MAKE"
arch=('any')
url="http://www.gnu.org/software/cons/"
license=('GPL2')
depends=('perl' 'perl-digest-md5')
source=("http://www.gnu.org/software/cons/stable/$pkgname-$pkgver.tgz")

package() {
  cd "$srcdir/$pkgname-$pkgver"
  install -Dm755 cons "$pkgdir/usr/bin/cons"
}

md5sums=('4e42d6aa29bc8c3da76e3ad6b9030414')
