# Maintainer: Kyle Keen <keenerd@gmail.com>
pkgname=safauri
pkgver=20111229
pkgrel=1
pkgdesc="Hunt down those wild new apps.  Returns the most recently added AUR packages."
arch=('any')
url="http://kmkeen.com/safauri/"
license=('GPL')
depends=('python2')
source=(http://kmkeen.com/safauri/$pkgname-$pkgver.tar.gz)
md5sums=('9806f47735be5f629398643734073911')

package() {
  cd "$srcdir/$pkgname"
  install -D -m 0755 safauri   "$pkgdir/usr/bin/safauri"
}

