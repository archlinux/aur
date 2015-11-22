# Maintainer: Christopher Arndt <aur at chrisarndt dot de>

pkgname=python-mando
pkgver=0.3.3
pkgrel=1
pkgdesc="A wrapper for the Python argparse module, which helps to write flexible CLI applications"
arch=('any')
url="https://mando.readthedocs.org/"
license=('MIT')
depends=('python')
source=("http://pypi.python.org/packages/source/m/mando/mando-${pkgver}.tar.gz")
md5sums=('4244d87684a3c49b888dc702589a7d5b')

package() {
  cd "$srcdir/mando-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1
}

# vim:set ts=2 sw=2 et:
