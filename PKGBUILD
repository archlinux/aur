# Maintainer: Kyle MacLeod <aur.kmac5@recursor.net>
pkgname=mlbv
pkgver=0.0.8
pkgrel=1
pkgdesc='Command-line interface to streaming MLB games (with MLB.tv subscription), game schedule and scores.'
arch=('any')
url='https://github.com/kmac/mlbv'
license=('GPL3')
depends=('python-requests' 'python-lxml' 'python-dateutil' 'streamlink')
makedepends=('python-setuptools')
source=("https://github.com/kmac/$pkgname/archive/v$pkgver.tar.gz")
md5sums=('efbc11a457670c738a05d8604f62fe11')

package() {
  cd "$srcdir/$pkgname-$pkgver"
  python setup.py install --root="$pkgdir" --optimize=1
}

# vim:set ts=2 sw=2 et:
