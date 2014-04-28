# Maintainer: Florian Bruhin (The Compiler) <archlinux.org@the-compiler.org>
# Contributor: Beej Jorgensen <beej@beej.us>

pkgname=python2-pypng
pkgver=0.0.16
pkgrel=1
pkgdesc="Python 2 module to decode and encode PNG files"
arch=('any')
url="https://github.com/drj11/pypng"
license=('MIT')
depends=('python2')
makedepends=('python2')
source=(https://github.com/drj11/pypng/archive/pypng-${pkgver}.tar.gz)
sha1sums=('656da1a46b82689154760b1863d3677472321c39')

package() {
  cd "$srcdir/pypng-pypng-$pkgver"
  python2 setup.py install --root="$pkgdir/" --optimize=1

  install -dm755 "$pkgdir/usr/share/licenses/$pkgname"
  install -Dm644 LICENCE "$pkgdir/usr/share/licenses/$pkgname"
}

# vim:set ts=2 sw=2 et:
