# Maintainer: Christian Schwarz <me@cschwarz.com>
pkgbase=python-yoctopuce
pkgname=("python-yoctopuce" "python2-yoctopuce")
pkgver=1.10.22936
pkgrel=1
pkgdesc="Yoctopuce Python API"
arch=('any')
url="https://pypi.python.org/pypi/yoctopuce"
license=('unknown')
makedepends=('python-setuptools' 'python2-setuptools')
options=(!emptydirs)
source=("https://pypi.python.org/packages/source/y/yoctopuce/yoctopuce-$pkgver.tar.gz")
md5sums=('f97ad6bc34a140044298ecac57370829')

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
