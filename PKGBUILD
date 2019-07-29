# Maintainer: Kyle MacLeod <aur.kmac5@recursor.net>
pkgname=mlbv
pkgver=0.0.13
pkgrel=1
pkgdesc='Command-line interface to MLB game information, schedule, scores, and standings.'
arch=('any')
url='https://github.com/kmac/mlbv'
license=('GPL3')
depends=('python-requests' 'python-lxml' 'python-dateutil' 'streamlink')
makedepends=('python-setuptools')
source=("https://github.com/kmac/$pkgname/archive/v$pkgver.tar.gz")
md5sums=('24843b1cebd370926383e5fd92d9c9c3')

package() {
  cd "$srcdir/$pkgname-$pkgver"
  python setup.py install --root="$pkgdir" --optimize=1
}

# vim:set ts=2 sw=2 et:
