# Maintainer: Matthew Treinish <mtreinish@kortar.org>
pkgbase=python-subunit2sql
pkgname=('python-subunit2sql' 'python2-subunit2sql')
pkgver=1.8.0
pkgrel=1
pkgdesc="Command to Read a subunit file or stream and put the data in a SQL DB"
arch=('any')
url=http://git.openstack.org/cgit/openstack-infra/subunit2sql
license=('Apache')
source=(  https://pypi.python.org/packages/5c/6d/57740d5b7d2b4eac7b2593379efd1d138d4d498c645259ead68a4a130729/subunit2sql-1.8.0.tar.gz )
md5sums=('4b265806b49a795a855056cfafe37ca0')
makedepends=('python' 'python2' 'python-setuptools' 'python2-setuptools' 'python-sphinx')

package_python-subunit2sql() {
  depends=('python' 'python-alembic' 'python-subunit' 'python-oslo-config' 'python-six' 'python-pbr' 'python-oslo-db' 'python-stevedore' 'python-dateutil' 'python-sqlalchemy')

  cd $srcdir/subunit2sql-$pkgver
  python setup.py install --root=$pkgdir
}

package_python2-subunit2sql() {
  depends=('python2' 'python2-alembic' 'python2-subunit' 'python2-oslo.config' 'python2-six' 'python2-pbr' 'python2-oslo-db' 'python2-stevedore' 'python2-dateutil' 'python2-sqlalchemy')

  cd $srcdir/subunit2sql-$pkgver
  python2 setup.py install --root=$pkgdir
}
