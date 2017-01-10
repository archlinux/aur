# Maintainer: Frederik “Freso” S. Olesen <freso.dk@gmail.com>
# Contributor: Adrian Sampson <adrian@radbox.org>

pkgname=python-munkres
pkgver=1.0.9
pkgrel=3
pkgdesc='munkres algorithm for the assignment problem'
depends=('python')
makedepends=('python-setuptools')
arch=('any')
source=("$pkgname-release-$pkgver.tar.gz::https://github.com/bmc/munkres/archive/release-$pkgver.tar.gz")
sha512sums=('1a358d7004bab5a7b085d830e47555485e55a086c7fdf74e3b929d06c9f052222c420d53ce849314c4f1b87ab4e8c383054046fe3ce2ae6d023e232229c09289')
url='http://bmc.github.com/munkres/'
license=('BSD')

package() {
  cd "$srcdir/munkres-release-$pkgver"
  /usr/bin/python setup.py install --root="$pkgdir" --optimize=1
}
