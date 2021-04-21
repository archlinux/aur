# Maintainer: Benjamin Winger <bmw@disroot.org>

pkgname=python-python-sat
pkgver=0.1.7.dev2
pkgrel=1
pkgdesc="A Python library for prototyping with SAT oracles"
provides=('python-python-sat')
conflicts=('python-python-sat')
arch=(any)
url="https://github.com/pysathq/pysat"
license=(GPL3)
depends=("python" "python-six")
source=("https://files.pythonhosted.org/packages/36/43/e646158ec760f4ba28641fd9ca4827aa4b8ee128564b6eebb5deb7e92188/python-sat-0.1.7.dev2.tar.gz")
sha512sums=('88e883dfcacbf2ab65ed438a984f1f9f16c4a2d41a15c047544155d2c9d9f79e7536d020eebc1741cc42d25b3f635e72a4cd4082a01709411613a1fa655b2926')

package() {
  cd "$srcdir/python-sat-$pkgver"
  python setup.py install --root $pkgdir
}
