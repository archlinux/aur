# Maintainer: M0Rf30

_pkgsrcname=PyRIC
pkgname=python2-pyric
pkgver=0.1.5
pkgrel=1
pkgdesc="Linux wireless library for the Python Wireless Developer and Pentester"
url="http://wraith-wireless.github.io/PyRIC/"
license=("MIT")
arch=("any")
depends=('python2' 'python2-twisted')
source=("https://github.com/wraith-wireless/PyRIC/archive/$pkgver.tar.gz")


package() {
  cd $srcdir/${_pkgsrcname}-$pkgver
  python2 setup.py install --root $pkgdir
  rm -rf $pkgdir/usr/lib/python2.7/site-packages/tests/
}

md5sums=('8430e19c3065cec2f85b46edac04c015')
