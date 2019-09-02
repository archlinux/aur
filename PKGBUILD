# Maintainer: Kyle MacLeod <aur.kmac5@recursor.net>
pkgname=mlbv
pkgver=0.0.16
pkgrel=1
pkgdesc='Command-line interface to MLB game information, schedule, scores, and standings.'
arch=('any')
url='https://github.com/kmac/mlbv'
license=('GPL3')
depends=('python-requests' 'python-lxml' 'python-dateutil' 'streamlink')
makedepends=('python-setuptools')
source=("https://github.com/kmac/$pkgname/archive/v$pkgver.tar.gz")
md5sums=('06c7cbc87ffa28af7c3c5e876edb6119')

package() {
  cd "$srcdir/$pkgname-$pkgver"
  python setup.py install --root="$pkgdir" --optimize=1
}

# vim:set ts=2 sw=2 et:
