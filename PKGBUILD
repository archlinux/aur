# Maintainer: Benjamin Winger <bmw@disroot.org>

pkgname=python-python-sat
pkgver=0.1.7.dev11
pkgrel=1
pkgdesc="A Python library for prototyping with SAT oracles"
provides=('python-python-sat')
conflicts=('python-python-sat')
arch=(any)
url="https://github.com/pysathq/pysat"
license=(GPL3)
depends=("python" "python-six")
source=("https://files.pythonhosted.org/packages/b0/7d/8646c100465c9e50921e0fe096cd3a2096cfd5a58ab0b0b7f9a9467b0e32/python-sat-0.1.7.dev11.tar.gz")
sha512sums=('ebfdca9a7548e41ef8ae271d50982e27960308610e4cfdaf5201d0b559b9ea615d6be65bbf79b497db0dd04e0dd08658ec198e94e58df7477093360a030aed60')

package() {
  cd "$srcdir/python-sat-$pkgver"
  python setup.py install --root $pkgdir
}
