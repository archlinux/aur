pkgname=python2-gertty
pkgver=1.3.0
pkgrel=1
pkgdesc="console-based interface to the Gerrit Code Review system"
arch=('any')
url='https://pypi.python.org/pypi/gertty'
license=('Apache2')
source=("https://pypi.python.org/packages/source/g/gertty/gertty-$pkgver.tar.gz")
md5sums=('fb01fdf8b15a81f83883e8871e0ecef4')
makedepends=('python2' 'python2-setuptools')
depends=('python2-gitpython' 'python2-sqlalchemy' 'python2-urwid' 'python2-dateutil' 'python2-requests' 'python2-ordereddict' 'python2-alembic' 'python2-yaml' 'python2-ply' 'python2-voluptuous' 'python2-pbr' 'python2-six')

package() {
  cd $srcdir/gertty-$pkgver
  pip2 install . --root=$pkdir 
}
