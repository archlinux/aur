# Maintainer: Adrian Sampson <adrian@radbox.org>

pkgname=python-munkres
pkgver=1.0.5.4
pkgrel=1
pkgdesc="munkres algorithm for the assignment problem"
depends=('python')
makedepends=('setuptools')
arch=('any')
source=(http://pypi.python.org/packages/source/m/munkres/munkres-$pkgver.tar.gz)
md5sums=(cb9d114fb523428bab4742e88bc83696)
url="http://bmc.github.com/munkres/"
license="BSD"

build() {
  cd $srcdir/munkres-$pkgver
  /usr/bin/python setup.py build || return 1
  /usr/bin/python setup.py install --root=$pkgdir
}
