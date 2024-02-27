# Maintainer: Jesus Alonso: <doragasu at hotmail dot com>
pkgname=python-mplcursors
pkgver=0.5.3
pkgrel=2
pkgdesc="Provides interactive data selection cursors for Matplotlib. It is inspired from mpldatacursor, with a much simplified API."
arch=('any')
url="https://github.com/anntzer/mplcursors"
license=('ZLIB')

depends=('python'
         'python-matplotlib'
         )

makedepends=('python-setuptools' )

source=(${url}/archive/refs/tags/v${pkgver}.tar.gz)
sha512sums=('fea3be519051732d09e669b77cba57e9a054ad82c19b7ab2a009aa43c0c63dabf2f911346da3351adf45acea0b2cda2773f3a60b9fe5f4264157cbb1c472835d')

package() {
  cd "$srcdir/mplcursors-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1
}

