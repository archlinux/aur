pkgname=python2-gertty
pkgver=1.3.2
pkgrel=1
pkgdesc="console-based interface to the Gerrit Code Review system"
arch=('any')
url='https://pypi.python.org/pypi/gertty'
license=('Apache2')
source=("https://pypi.python.org/packages/source/g/gertty/gertty-$pkgver.tar.gz")
md5sums=('5f4a49840d63d445834b8ba9598ce9cd')
makedepends=('python2' 'python2-setuptools')
depends=('python2-git' 'python2-sqlalchemy' 'python2-urwid' 'python2-dateutil' 'python2-requests' 'python2-ordereddict' 'python2-alembic' 'python2-yaml' 'python2-ply' 'python2-voluptuous' 'python2-pbr' 'python2-six')

package() {
  cd $srcdir/gertty-$pkgver
  python2 setup.py install --root=$pkgdir
}
