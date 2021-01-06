# Contributor: Lex Black <autumn-wind at web dot de>
# Contributor: alejandrogomez <alejandroogomez@gmail.com>

pypiname=isit
pkgbase=python-isit
pkgname=('python-isit' 'python2-isit')
pkgver=0.3.6
pkgrel=1.1
pkgdesc="Python library for discovering environment information (OS, Distribution, Python version)"
arch=('any')
url="https://pypi.python.org/pypi/isit/"
license=('AGPLv3')
makedepends=('python' 'python2')
source=(https://pypi.io/packages/source/i/$pypiname/$pypiname-$pkgver.tar.gz)
md5sums=('cee801e13e06ce02463a66d5b8076bee')


package_python-isit() {
  pkgdesc+=" (Python3.x)"
  depends=('python')
  cd "$srcdir/$pypiname-$pkgver"

  python setup.py install --root="$pkgdir/" --prefix=/usr --optimize=1
}

package_python2-isit() {
  pkgdesc+=" (Python2.x)"
  depends=('python2')

  cd "$srcdir/$pypiname-$pkgver"

  python2 setup.py install --root="$pkgdir/" --prefix=/usr --optimize=1
}
