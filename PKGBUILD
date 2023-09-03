# Maintainer: Benjamin Winger <bmw@disroot.org>

_pkgname=python-sat
pkgname=python-python-sat
pkgver=0.1.8.dev9
pkgrel=1
pkgdesc="A Python library for prototyping with SAT oracles"
arch=(any)
url="https://github.com/pysathq/pysat"
license=(GPL3)
depends=("python" "python-six")
source=("https://files.pythonhosted.org/packages/source/${_pkgname:0:1}/${_pkgname}/${_pkgname}-${pkgver}.tar.gz")
sha512sums=('53eef81c990868cd39a95da91e3f7789884f590d3b199cd9ed4089cebef39bc2d5d26c80db856dbb8c05436358db7e6bda5d894ece524d11455bb77f25006e6b')

package() {
  cd "$srcdir/python-sat-$pkgver"
  python setup.py install --root $pkgdir
}
