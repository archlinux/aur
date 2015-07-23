# Maintainer: Felix Yan <felixonmars@gmail.com>

_pkgname=umemcache
pkgname=python2-$_pkgname
pkgver=1.4
pkgrel=1
pkgdesc="Ultra fast memcache client written in highly optimized C++ with Python bindings"
arch=('i686' 'x86_64')
url=('https://github.com/esnme/ultramemcache')
license=("GPL")
depends=('python2')
source=(
  "http://pypi.python.org/packages/source/u/$_pkgname/$_pkgname-$pkgver.zip"
)

build() {
  :
}

package() {
  cd $srcdir/$_pkgname-$pkgver
  python2 setup.py install --root=$pkgdir
}
md5sums=('cd9c989d448cdfd096ecebdf9ab1c912')
