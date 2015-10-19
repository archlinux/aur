# Maintainer: Christian Schwarz <me@cschwarz.com>
pkgbase=python-phidgets 
pkgname=("python-phidgets" "python2-phidgets")
pkgver=2.1.8
pkgrel=1
pkgdesc="Python Wrapper library for the Phidgets API"
arch=('any')
url="https://pypi.python.org/pypi/Phidgets"
license=('custom: Creative Commons Attribution 2.5 Canada License')
makedepends=('python-setuptools' 'python2-setuptools')
options=(!emptydirs)
source=("https://pypi.python.org/packages/source/P/Phidgets/Phidgets-$pkgver.tar.gz")
md5sums=("70abc2edef4578842906b6a46eef9ad9")

package_python-phidgets() {
  depends=("python")
  cd "$srcdir/Phidgets-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1
}

package_python2-phidgets() {
  depends=("python2")
  cd "$srcdir/Phidgets-$pkgver"
  python2 setup.py install --root="$pkgdir/" --optimize=1
}


# vim:set ts=2 sw=2 et:
