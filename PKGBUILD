# Maintainer: Anthony25 <Anthony Ruhier>

pkgbase=python-flask-migrate
_pkgbase="Flask-Migrate"
pkgname=(python-flask-migrate)
pkgver=2.0.3
pkgrel=1
pkgdesc='SQLAlchemy database migrations for Flask applications using Alembic..'
arch=(any)
url='https://github.com/miguelgrinberg/Flask-Migrate/'
license=(MIT)
makedepends=(
  'python-flask'
  'python-flask-script'
  'python-flask-sqlalchemy'
  'python-setuptools'
)
depends=(
  'python-flask'
  'python-flask-script'
  'python-flask-sqlalchemy'
)
options=(!emptydirs)
source=("https://github.com/miguelgrinberg/${_pkgbase}/archive/v${pkgver}.tar.gz")
sha256sums=('78db13d0afa9410fa9d41cab584358b4ac13160ccc1ac02e10ba11bdb0a8b6ff')

package_python-flask-migrate() {
  cd "${srcdir}/${_pkgbase}-${pkgver}"
  python setup.py install --root="${pkgdir}/" --optimize=1
  install -Dm 644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

# vim:set ts=2 sw=2 et:
