# Maintainer: Christian Schwarz <me@cschwarz.com>
pkgbase=python-yoctopuce
pkgname=("python-yoctopuce" "python2-yoctopuce")
pkgver=1.10.21816
pkgrel=1
pkgdesc="Yoctopuce Python API"
arch=('any')
url="https://pypi.python.org/pypi/yoctopuce"
license=('unknown')
makedepends=('python-setuptools' 'python2-setuptools')
options=(!emptydirs)
source=("https://pypi.python.org/packages/source/y/yoctopuce/yoctopuce-$pkgver.tar.gz")
md5sums=("ff246bacbc10f672e6b23f342d282326")

package_python-yoctopuce() {
  depends=("python")
  cd "$srcdir/yoctopuce-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1
}

package_python2-yoctopuce() {
  depends=("python2")
  cd "$srcdir/yoctopuce-$pkgver"
  python2 setup.py install --root="$pkgdir/" --optimize=1
}


# vim:set ts=2 sw=2 et:
