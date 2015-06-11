# Maintainer: Antony Lee <anntzer dot lee at gmail dot com>

pkgname=python-statprof
pkgver=0.2.0
pkgrel=1
pkgdesc='Statistical profiling for Python'
arch=('any')
url='http://pypi.python.org/pypi/statprof-smarkets/'
license=('GPL2')
depends=('python')
source=("http://pypi.python.org/packages/source/s/statprof-smarkets/statprof-smarkets-$pkgver.tar.gz")
md5sums=('ee44e4a7648f00b54e53df6e8b0ba724')

package() {
  cd "$srcdir/statprof-smarkets-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1
}

