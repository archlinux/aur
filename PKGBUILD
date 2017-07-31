# Maintainer: Amos Onn <amosonn at gmail dot com>
pkgname=python-zict
pkgver=0.1.2
pkgrel=1
pkgdesc="A python library for Mutable Mapping interfaces."
arch=('any')
url="http://zict.readthedocs.io/en/stable/"
license=('BSD-3-clause')
depends=('python>=3.5' 'python-heapdict')
source=(https://codeload.github.com/dask/zict/tar.gz/$pkgver)
sha256sums=('73c9ce041ac9d71c729a243168b20e9b45b82871f3bea776b97929289176ae90')
package() {
  cd $srcdir/zict-$pkgver
  python setup.py install --root=$pkgdir || return 1
  install -d $pkgdir/usr/share/licenses/$pkgname
  install LICENSE.txt $pkgdir/usr/share/licenses/$pkgname/COPYING
}
