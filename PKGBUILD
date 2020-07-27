# Maintainer: talone <talone@boxph.one>

pkgname=python-yoyo-migrations
pkgver=7.2.0
pkgrel=1
pkgdesc='Database migrations with SQL'
arch=(any)
url='https://ollycope.com/software/yoyo/latest/'
license=(Apache)
depends=('python' 'python-iniherit' 'python-text-unidecode')
makedepends=('python-pip')
source=('https://files.pythonhosted.org/packages/source/y/yoyo-migrations/yoyo-migrations-$pkgver.tar.gz')
sha256sums=('a54f6176ff6da3330be537c962235aaa9e5f7f2aae563b1c531b1cb616d80359')

package() {
	cd yoyo-migrations-$pkgver
	python setup.py install -O1 --root="$pkgdir"
}
