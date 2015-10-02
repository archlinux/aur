# Maintainer: gosella <gosella@gmail.com>
# Submitter: OK100 <ok100.ok100.ok100@gmail.com>

pkgname=('python-pager' 'python2-pager')
pkgver=3.3
pkgrel=3
pkgdesc='Terminal/console pager module for Python'
arch=('any')
url='http://pypi.python.org/pypi/pager'
license=('Public Domain')
makedepends=('python-setuptools' 'python2-setuptools')
source=("http://pypi.python.org/packages/source/p/pager/pager-$pkgver.tar.gz")
md5sums=('fbebda4d8d537c8aa0de883d15b87b95')

package_python-pager() {
  depends=('python')

  cd "$srcdir/pager-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1
}

package_python2-pager() {
  depends=('python2')

  cd "$srcdir/pager-$pkgver"
  python2 setup.py install --root="$pkgdir/" --optimize=1
}

# vim:set ts=2 sw=2 et:
