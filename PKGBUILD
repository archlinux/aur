pkgname=python2-migrate-kilo
pkgver=0.9.6
pkgrel=1
pkgdesc="provides a way to deal with database schema changes in SQLAlchemy projects"
arch=(any)
url="http://sqlalchemy-migrate.googlecode.com/"
depends=('python2' 'python2-sqlalchemy' 'python2-decorator'
	 'python2-tempita' 'python2-pip' 'python2-six' 'python2-decorator'
	 'python2-pbr')
makedepends=('python2-setuptools' 'git')
provides=('python2-migrate')
license=('MIT')
source=("https://pypi.python.org/packages/source/s/sqlalchemy-migrate/sqlalchemy-migrate-$pkgver.tar.gz")
md5sums=('SKIP')

package() {
  cd $srcdir/sqlalchemy-migrate-$pkgver
  python2 setup.py install --root=$pkgdir
  install -Dm0755 COPYING $pkgdir/usr/share/licenses/$pkgname/LICENSE
}

