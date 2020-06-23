# Maintainer: Benjamin Winger <bmw@disroot.org>

pkgname=python-python-sat
pkgver=0.1.5.dev16
pkgrel=1
pkgdesc="A Python library for prototyping with SAT oracles"
provides=('python-python-sat')
conflicts=('python-python-sat')
arch=(any)
url="https://github.com/pysathq/pysat"
license=(GPL3)
depends=("python" "python-six")
source=("https://files.pythonhosted.org/packages/64/d8/50e9b3473ccc48018d121db0c3edf6b98706d0262edf991f1f1e602f8d11/python-sat-0.1.5.dev16.tar.gz")
sha512sums=('36a6a7abe98874654ffe9cf4f15e25ae15a0e8b040ea04e37fe6337db0123dfe1f7beea2c7701936d79bbe1b60fe776630578ac5e5f0124e6b6559b5171072f7')

package() {
  cd "$srcdir/python-sat-$pkgver"
  python setup.py install --root $pkgdir
}
