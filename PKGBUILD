pkgname=python-heapdict
pkgver=1.0.0
pkgrel=1
pkgdesc="A python library for a heap with decrease- and increase-key operations."
arch=('any')
url="http://stutzbachenterprises.com"
license=('BSD-3-clause')
depends=('python>=3.5')
source=(https://codeload.github.com/DanielStutzbach/heapdict/tar.gz/v$pkgver)
sha256sums=('4c8e581f1651ca78da35820fc80b0d50fc060032517f2c7efd9169e204db3793')

package() {
  cd $srcdir/heapdict-$pkgver
  python setup.py install --root=$pkgdir || return 1
  install -d $pkgdir/usr/share/licenses/$pkgname
  install LICENSE $pkgdir/usr/share/licenses/$pkgname/COPYING
}
