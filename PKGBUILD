# Maintainer: Sergey Shatunov <me@prok.pw>

_pkgname=sqlalchemy-migrate
pkgname=python2-${_pkgname}
pkgver=0.10.0
pkgrel=1
arch=('any')
pkgdesc="Database schema migration for SQLAlchemy"
url="https://github.com/openstack/sqlalchemy-migrate"
license=('MIT')
depends=('python2' 'python2-sqlalchemy')
source=("https://files.pythonhosted.org/packages/source/${_pkgname:0:1}/${_pkgname}/${_pkgname}-${pkgver}.tar.gz" )
md5sums=('af20c212b3379c142a1b3f66bb39b6d8')

package() {
  cd "${srcdir}/${_pkgname}-${pkgver}"

  python2 setup.py install --prefix=/usr --root="$pkgdir" --optimize=1
}
