# Maintainer: Felix Yan <felixonmars@gmail.com>
# Contributor: Gerardo Exequiel Pozzi <vmlinuz386@yahoo.com.ar>

pkgname=python2-py-radix
pkgver=0.9.3
pkgrel=1
pkgdesc="Implements the radix tree data structure"
arch=('x86_64')
url="https://github.com/mjschultz/py-radix"
license=("BSD")
depends=('python2')
source=(https://pypi.python.org/packages/source/p/py-radix/py-radix-0.9.3.tar.gz)
md5sums=('2b5456ae8ab03c7461eb364076afa2cb')

package() {
  cd "$srcdir/py-radix-0.9.3"
  python2 setup.py install -O1 --root="$pkgdir"
}
