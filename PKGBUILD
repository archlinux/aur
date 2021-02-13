# Maintainer: Benjamin Winger <bmw@disroot.org>

pkgname=python-python-sat
pkgver=0.1.6.dev12
pkgrel=1
pkgdesc="A Python library for prototyping with SAT oracles"
provides=('python-python-sat')
conflicts=('python-python-sat')
arch=(any)
url="https://github.com/pysathq/pysat"
license=(GPL3)
depends=("python" "python-six")
source=("https://files.pythonhosted.org/packages/e6/c7/5afc9b9abc4bee884df2e9b591b52b9d21f4ed836683f1f1a256150e11ad/python-sat-0.1.6.dev12.tar.gz")
sha512sums=('1560e7d9d1d75e32a4a717a98b37a5f35440fc7dd5c9b67bf76c647bfdc10d3186909fe38ad0f9810b265ec8790b15168708d89d5f4d1ddf5adf8487253ca90f')

package() {
  cd "$srcdir/python-sat-$pkgver"
  python setup.py install --root $pkgdir
}
