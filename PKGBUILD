# Maintainer: Sam Whited <sam@samwhited.com>

pkgname=python-psycopg2-binary
_pkgname=psycopg2-binary
pkgver=2.7.6.1
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
sha256sums=('8d517e8fda2efebca27c2018e14c90ed7dc3f04d7098b3da2912e62a1a5585fe')

package() {
	cd "${srcdir}/${_pkgname}-${pkgver}"
	python setup.py install --root="${pkgdir}"
}
