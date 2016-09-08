# Maintainer: M0Rf30

_pkgsrcname=PyRIC
pkgname=python2-pyric
pkgver=0.1.6.1
pkgrel=1
pkgdesc="Linux wireless library for the Python Wireless Developer and Pentester"
url="http://wraith-wireless.github.io/PyRIC/"
license=("MIT")
arch=("any")
depends=('python2' 'python2-twisted')
source=("https://pypi.python.org/packages/e1/56/cb834d27ef717594f0179c8c0eefb20af5a09bb10e76b7f8b787bbe8529d/PyRIC-$pkgver.tar.gz")


package() {
  cd $srcdir/${_pkgsrcname}-$pkgver
  python2 setup.py install --root $pkgdir
  rm -rf $pkgdir/usr/lib/python2.7/site-packages/tests/
}

md5sums=('0e1077a4fa1a567aaa6daec23ebf4571')
