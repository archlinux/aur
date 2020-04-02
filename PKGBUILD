# Maintainer: Benjamin Winger <bmw@disroot.org>

pkgname=python-python-sat
pkgver=0.1.5.dev10
pkgrel=1
pkgdesc="A Python library for prototyping with SAT oracles"
provides=('python-python-sat')
conflicts=('python-python-sat')
arch=(any)
url="https://github.com/pysathq/pysat"
license=(GPL3)
depends=("python" "python-six")
source=("https://files.pythonhosted.org/packages/3a/4d/2b121fc0b6224112c932863c7b83e87e5f86c1f44d00d0531581da044525/python-sat-0.1.5.dev10.tar.gz")
sha512sums=('a12797a84b66b227ec5278aa4d4418c0a0f0c3afb661a776111a890e835041a00fd2182a14e4b6b6c534048b4431e27bee545365ccdabfc640f5f649bec206d2')

package() {
  cd "$srcdir/python-sat-$pkgver"
  python setup.py install --root $pkgdir
}
