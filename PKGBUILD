# Maintainer: Matthew Treinish <mtreinish@kortar.org>
pkgbase=python-oslo-db
pkgname=('python-oslo-db' 'python2-oslo-db')
pkgver=4.28.0
pkgrel=1
pkgdesc="Oslo Database library"
arch=('any')
url=http://git.openstack.org/cgit/openstack/oslo.db
license=('Apache')
source=( https://pypi.python.org/packages/7a/61/e8b50150a9fd9412f05d36f764c4a7dc38599b583fb8b274458ced73d133/oslo.db-4.28.0.tar.gz )
md5sums=('c8d7ff50e84168bc7054522f867bdfe8')
makedepends=('python' 'python2' 'python-setuptools' 'python2-setuptools')

package_python-oslo-db() {
  depends=('python' 'python-alembic>=0.8.10' 'python-oslo-utils>=3.28.0' 'python-oslo-config>=4.6.0' 'python-six>=1.9.0' 'python-pbr' 'python-stevedore>=1.20.0' 'python-migrate' 'python-sqlalchemy' 'python-oslo-i18n>=3.15.3' 'python-debtcollector>=1.2.0' 'python-alembic>0.8.10')

  cd $srcdir/oslo.db-$pkgver
  python setup.py install --root=$pkgdir
}

package_python2-oslo-db() {
  depends=( 'python2' 'python2-alembic>=0.8.10' 'python2-oslo-utils>=3.28.0' 'python2-oslo-config>=4.6.0' 'python2-six>=1.9.0' 'python2-pbr' 'python2-stevedore>=1.20.0' 'python2-migrate' 'python2-sqlalchemy' 'python2-oslo-i18n>=3.15.3' 'python2-debtcollector>=1.2.0' 'python2-alembic>0.8.10' )
  
  cd $srcdir/oslo.db-$pkgver
  python2 setup.py install --root=$pkgdir
}
