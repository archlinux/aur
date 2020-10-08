# Maintainer: Benjamin Winger <bmw@disroot.org>

pkgname=python-python-sat
pkgver=0.1.6.dev9
pkgrel=1
pkgdesc="A Python library for prototyping with SAT oracles"
provides=('python-python-sat')
conflicts=('python-python-sat')
arch=(any)
url="https://github.com/pysathq/pysat"
license=(GPL3)
depends=("python" "python-six")
source=("https://files.pythonhosted.org/packages/b1/0e/b40bc277d7c7a0567219d97b020259429eec0fa274bd580494767be07193/python-sat-0.1.6.dev9.tar.gz")
sha512sums=('d627263a93c590a9cd2692207e5d2c264d3e555d3b5dac4055759d0c7fc88d98f03115970a4160e8079aa0ded4852fc233f56a3c8c53b8609b9e93d7f7c67066')

package() {
  cd "$srcdir/python-sat-$pkgver"
  python setup.py install --root $pkgdir
}
