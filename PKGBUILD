# Contributor: Lex Black <autumn-wind at web dot de>
# Contributor: alejandrogomez <alejandroogomez@gmail.com>

pypiname=isit
pkgbase=python-isit
pkgname=('python-isit' 'python2-isit')
pkgver=0.3.3
pkgrel=1
pkgdesc="Python library for discovering environment information (OS, Distribution, Python version)"
arch=('any')
url="http://pypi.python.org/pypi/isit/"
license=('AGPLv3')
makedepends=('python' 'python2')
source=(http://pypi.python.org/packages/source/i/$pypiname/$pypiname-$pkgver.tar.gz)
md5sums=('a5db24cf97ebef815dde3c593466330f')


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
