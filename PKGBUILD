# Maintainer: Aaron DeVore <aaron.devore@gmail.com>
# Contributor: tocer <tocer.deng@gmail.com>

pkgname=(python-fudge python2-fudge)
pkgver=1.1.0
pkgrel=1
pkgdesc="Use fake objects (mocks, stubs, etc) to test real ones"
arch=(any)
url="http://farmdev.com/projects/fudge/"
license=(MIT)
makedepends=('python-setuptools' python2-setuptools)
optdepends=('python-fudge-docs: documentation for Fudge')
source=("http://pypi.python.org/packages/source/f/fudge/fudge-$pkgver.tar.gz")
md5sums=('2e10ff35c998bf4bce8c5a986c5181bd')

package_python-fudge() {
  cd "$srcdir/fudge-$pkgver"
  depends=('python')
  python setup.py install --root=$pkgdir/ --optimize=1
  install -Dm644 LICENSE.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE.txt"
}
  
package_python2-fudge() {
  cd "$srcdir/fudge-$pkgver"
  depends=('python2')
  python2 setup.py install --root=$pkgdir/ --optimize=1
  install -Dm644 LICENSE.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE.txt"
}
 