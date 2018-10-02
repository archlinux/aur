# Maintainer: Sam Whited <sam@samwhited.com>

pkgname=python-psycopg2-binary
_pkgname=psycopg2-binary
pkgver=2.7.5
pkgrel=2
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
sha256sums=('c2ac7aa1a144d4e0e613ac7286dae85671e99fe7a1353954d4905629c36b811c')

package() {
	cd "${srcdir}/${_pkgname}-${pkgver}"
	python setup.py install --root="${pkgdir}"
}
