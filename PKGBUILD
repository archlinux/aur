# Maintainer: Anthony25 <Anthony Ruhier>

pkgbase=python-flask-migrate
_pkgbase="Flask-Migrate"
pkgname=(python-flask-migrate)
pkgver=2.1.1
pkgrel=1
pkgdesc='SQLAlchemy database migrations for Flask applications using Alembic..'
arch=(any)
url='https://github.com/miguelgrinberg/Flask-Migrate/'
license=(MIT)
makedepends=(
  'python-setuptools'
)
depends=(
  'python-alembic'
  'python-flask'
  'python-flask-script'
  'python-flask-sqlalchemy'
)
options=(!emptydirs)
source=("https://github.com/miguelgrinberg/${_pkgbase}/archive/v${pkgver}.tar.gz")
sha256sums=('883854c9c811746c1d989f4e707e3815d7d3e43316d6cee832e53897737a90e5')

package_python-flask-migrate() {
  cd "${srcdir}/${_pkgbase}-${pkgver}"
  python setup.py install --root="${pkgdir}/" --optimize=1
  install -Dm 644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

# vim:set ts=2 sw=2 et:
