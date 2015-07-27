# Maintainer: Alexander Minges <alexander.minges@gmail.com>
# Contributor: Antonio Lucas <antonioluccas@gmail.com>
pkgname=python-tidylib
_realname=pytidylib
pkgver=0.2.4
pkgrel=1
pkgdesc="Python bindings for Tidy HTML parser/cleaner."
arch=('i686' 'x86_64')
url="http://countergram.com/open-source/${_realname}"
license=('MIT')
depends=('tidyhtml' 'python')
source=("https://github.com/countergram/${_realname}/archive/$pkgver.tar.gz")
sha256sums=('5bdc5a6889742ae0a8be21166fe92c895b23dd4114db39bb23bffe66db3c9079')

package() {
  cd $startdir/src/$_realname-$pkgver
  python setup.py install --root=$startdir/pkg || return 1
}
