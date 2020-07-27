# Maintainer: talone <talone@boxph.one>

pkgname=python-yoyo-migrations
pkgver=6.1.0
pkgrel=4
pkgdesc='Database migrations with SQL'
arch=(any)
url='https://ollycope.com/software/yoyo/latest/'
license=(Apache)
depends=('python' 'python-iniherit' 'python-text-unidecode')
makedepends=('python-pip')
source=("https://files.pythonhosted.org/packages/source/y/yoyo-migrations/yoyo-migrations-$pkgver.tar.gz")
sha256sums=('4538dbdfe4784c30bade14275558247ec8ce8111b4948dc38f51d4172f9d513c')

package() {
	cd yoyo-migrations-$pkgver
	python setup.py install -O1 --root="$pkgdir"
}
