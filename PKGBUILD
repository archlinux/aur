# Maintainer: Gabriel Magno <gabrielmagno1@gmail.com>

_pkgname=randomdotorg
pkgname=python2-$_pkgname
pkgver=0.1.3a3
pkgrel=1
pkgdesc="Implements python's random number interface by fetching data from random.org"
arch=('any')
url="http://code.google.com/p/randomdotorg/"
license=('GPL')
source=("https://pypi.python.org/packages/source/r/$_pkgname/$_pkgname-$pkgver.tar.gz")

package() {
  cd "$srcdir/$_pkgname-$pkgver"
  python2 setup.py install --root="$pkgdir/" --optimize=1
}

sha256sums=('63545d0c2f4895815b98c0e0df66d703da61f7079b3409a3056af4f7c959ede6')

# vim:set ts=2 sw=2 et:
