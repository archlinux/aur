# Contributor: Bug <bug2000@gmail.com>
# Maintainer: Bug <bug2000@gmail.com>
pkgname=xpmidi
pkgver=5.0
pkgrel=1
pkgdesc="pmidi X frontend"
arch=('any')
url="https://www.mellowood.ca/xpmidi/"
license=('GPL')
depends=('python' 'tk')
source=("https://www.mellowood.ca/$pkgname/$pkgname-$pkgver.tar.gz")
sha1sums=('8d2fac01b128fe445fd7c5f84f26a5b0ad0ddcb4')

build() {
  cd "$srcdir/$pkgname-$pkgver"
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  install -D xpmidi.py $pkgdir/usr/bin/xpmidi
}

# vim:set ts=2 sw=2 et:
