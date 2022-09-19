# Maintainer: portaloffreedom

_pkgsrcname=PyRIC
pkgname=python-pyric
pkgver=0.1.6.3
pkgrel=1
pkgdesc="Linux wireless library for the Python Wireless Developer and Pentester"
url="http://wraith-wireless.github.io/PyRIC/"
license=("MIT")
arch=("any")
depends=('python' 'python-twisted')
makedepends=('python-setuptools')
source=("https://pypi.python.org/packages/08/64/a99f27d3b4347486c7bfc0aa516016c46dc4c0f380ffccbd742a61af1eda/PyRIC-$pkgver.tar.gz")

md5sums=('c711069b2c1cb4fcc16312fed9b4d287')

package() {
  cd $srcdir/${_pkgsrcname}-$pkgver
  python3 setup.py install --root $pkgdir
  rm -rf $pkgdir/usr/lib/python3.*/site-packages/tests/
}

