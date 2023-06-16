# Maintainer: talone <talone@boxph.one>

pkgname=python-yoyo-migrations
pkgver=8.2.0
pkgrel=1
pkgdesc='Database migrations with SQL'
arch=(any)
url='https://ollycope.com/software/yoyo/latest/'
license=(Apache)
depends=('python' 'python-iniherit' 'python-text-unidecode' 'python-sqlparse')
makedepends=('python-setuptools' 'python-pip')
source=("https://files.pythonhosted.org/packages/source/y/yoyo-migrations/yoyo-migrations-$pkgver.tar.gz")
sha256sums=('820606a03e262cf1cd4f59e256c28fa446425224d5b82a3d1275fd78178523e4')

package() {
	cd yoyo-migrations-$pkgver
	python setup.py install -O1 --root="$pkgdir"
}
