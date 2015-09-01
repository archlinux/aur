pkgname=python2-gertty
pkgver=1.0.3
pkgrel=1
pkgdesc="console-based interface to the Gerrit Code Review system"
arch=('any')
url='https://pypi.python.org/pypi/gertty'
license=('Apache2')
source=("https://pypi.python.org/packages/source/g/gertty/gertty-$pkgver.tar.gz")
md5sums=('6109bf33ea454d9f148ce47dc12bb654')
makedepends=('python2' 'python2-setuptools')
depends=('python2-gitpython' 'python2-sqlalchemy' 'python2-urwid' 'python2-dateutil' 'python2-requests' 'python2-ordereddict' 'python2-alembic' 'python2-yaml' 'python2-ply' 'python2-voluptuous' 'python2-pbr')

package() {
  cd $srcdir/gertty-$pkgver
  pip2 install . --root=$pkdir 
}
