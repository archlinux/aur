pkgname=python-zict
pkgver=0.1.1
pkgrel=1
pkgdesc="A python library for Mutable Mapping interfaces."
arch=('any')
url="http://zict.readthedocs.io/en/stable/"
license=('BSD-3-clause')
depends=('python>=3.5' 'python-heapdict')
source=(https://codeload.github.com/dask/zict/tar.gz/$pkgver.tar.gz)
sha256sums=('47433371de32aa20893f1f04a1c591c6bfc2aac375563790f9ab4e5c709e26ce')
package() {
  cd $srcdir/zict-$pkgver
  python setup.py install --root=$pkgdir || return 1
  install -d $pkgdir/usr/share/licenses/$pkgname
  install LICENSE.txt $pkgdir/usr/share/licenses/$pkgname/COPYING
}
