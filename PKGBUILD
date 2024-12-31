# Maintainer: Jesus Alonso: <doragasu at hotmail dot com>
pkgname=python-mplcursors
pkgver=0.6
pkgrel=1
pkgdesc="Provides interactive data selection cursors for Matplotlib. It is inspired from mpldatacursor, with a much simplified API."
arch=('any')
url="https://github.com/anntzer/mplcursors"
license=('ZLIB')

depends=('python'
         'python-matplotlib'
         )

makedepends=('python-setuptools' )

source=(${url}/archive/refs/tags/v${pkgver}.tar.gz)
sha512sums=('4bcee5e01492deb4fed851daf0e6b01e217da257389af768b61a8c69bf7115727c9faef17f5f9455de1c718c52a18aab24ce5eeb625e1207810fd8b3d93ec503')

package() {
  cd "$srcdir/mplcursors-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1
}

