# Maintainer: talone <talone@boxph.one>

pkgname=python-yoyo-migrations
pkgver=7.2.1
pkgrel=3
pkgdesc='Database migrations with SQL'
arch=(any)
url='https://ollycope.com/software/yoyo/latest/'
license=(Apache)
depends=('python' 'python-iniherit' 'python-text-unidecode' 'python-sqlparse')
makedepends=('python-pip')
source=("https://files.pythonhosted.org/packages/source/y/yoyo-migrations/yoyo-migrations-$pkgver.tar.gz")
sha256sums=('89b6d51e9fcc8f7b413ebfa99576d19a71c0a04a0917898e45ad02c711e5f0da')

package() {
	cd yoyo-migrations-$pkgver
	python setup.py install -O1 --root="$pkgdir"
}
