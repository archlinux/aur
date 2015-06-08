# Maintainer: Phil Schaf <flying-sheep@web.de>
_name=unicodeblocks
pkgname=python-unicodeblocks
pkgver=0.3
pkgrel=1
pkgdesc='Supplements unicodedata standard library module with ability to lookup and work with Unicode blocks'
arch=('any')
url="http://pypi.python.org/pypi/$_name"
license=('ISC')
depends=('python')
source=("https://pypi.python.org/packages/source/u/$_name/$_name-$pkgver.tar.gz")
md5sums=('6d5c1a27c6080b092d35c939fd64c8f5')

package() {
	cd "$srcdir/$_name-$pkgver"
	python setup.py install --root="$pkgdir" --optimize=1 || return 1
}