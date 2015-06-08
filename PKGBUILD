# Maintainer: Daniel Nagy <danielnagy at gmx de>

pkgname=python2-coffin
pkgver=0.3.8
pkgrel=1
pkgdesc="Jinja2 adapter for Django"
arch=(any)
url="https://pypi.python.org/pypi/Coffin"
license=( 'BSD3' )
depends=( 'python2' )
source=( "coffin-$pkgver.tar.gz::https://pypi.python.org/packages/source/C/Coffin/Coffin-$pkgver.tar.gz" )
md5sums=('107b9a62adbe15ce6330033a100b4f0b')

build() {
  cd $srcdir/Coffin-$pkgver
  python2 setup.py build
}

package() {
  cd $srcdir/Coffin-$pkgver
  python2 setup.py install --prefix=/usr --root="$pkgdir"
}
