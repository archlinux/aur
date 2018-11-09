# Maintainer: Sam Whited <sam@samwhited.com>

pkgname=python-psycopg2-binary
_pkgname=psycopg2-binary
pkgver=2.7.6
pkgrel=1
pkgdesc='Python-PostgreSQL Database Adapter'
conflicts=('python-psycopg2')
url='http://initd.org/psycopg/'
arch=('x86_64')
license=(
	'LGPL3'
	'ZPL'
)
depends=(
	'postgresql-libs'
	'python'
)
makedepends=('python-setuptools')

source=("https://pypi.python.org/packages/source/p/${_pkgname}/${_pkgname}-${pkgver}.tar.gz")
sha256sums=('80bf63fa9493c82d72788376c7342a27b8c4f07971be405cbb886c6b025bebc8')

package() {
	cd "${srcdir}/${_pkgname}-${pkgver}"
	python setup.py install --root="${pkgdir}"
}
