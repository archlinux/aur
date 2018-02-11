# Maintainer: Guillaume Horel <guillaume.horel@gmail.com>

pkgname=python-nose-random
_pkgname=nose-random
pkgver=1.0.0
pkgrel=1
pkgdesc="Nose plugin to facilitate randomized unit testing"
arch=('any')
url="https://github.com/Zoomer-Analytics/nose-random"
license=('MIT')
depends=('python')
checkdepends=('python-nose')
optdepends=()
makedepends=('python-setuptools')
source=("https://github.com/ZoomerAnalytics/nose-random/archive/$pkgver.tar.gz")
sha256sums=('528b1c9396cfa415741afaad60ecde695a657c9364dc01240050c747192f5148')

package(){
  cd "$srcdir/$_pkgname-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1
}

check(){
  cd "$srcdir/$_pkgname-$pkgver"
  nosetests examples
}
# vim:ts=2:sw=2:et:
