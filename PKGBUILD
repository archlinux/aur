pkgname=python2-pushy
pkgver=0.5.3
pkgrel=1
pkgdesc="A library for transparently accessing objects in a remote Python interpreter"
url="http://awilkins.id.au/pushy/"
depends=('python2' 'python2-paramiko')
makedepends=('python2-distribute' )
license=('MIT')
arch=('any')
source=("https://pypi.python.org/packages/source/p/pushy/pushy-${pkgver}.zip")
md5sums=('deb2cb14fdb4bee4684f44f919cb4cae')

build() {
  cd $srcdir/pushy-$pkgver
  python2 setup.py build
}

package() {
  cd $srcdir/pushy-$pkgver
  python2 setup.py install --root="$pkgdir" --optimize=1
}
