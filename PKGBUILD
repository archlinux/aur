# Maintainer: Frederik “Freso” S. Olesen <freso.dk@gmail.com>
# Contributor: Phil Schaf <flying-sheep@web.de>

_name=enum34
pkgname=python-enum34
pkgver=1.1.6
pkgrel=1
pkgdesc='Python 3.4 Enum backported'
arch=('any')
url="http://pypi.python.org/pypi/$_name"
license=('BSD')
depends=('python')
source=("https://pypi.python.org/packages/bf/3e/31d502c25302814a7c2f1d3959d2a3b3f78e509002ba91aea64993936876/$_name-$pkgver.tar.gz")
md5sums=('5f13a0841a61f7fc295c514490d120d0')

package() {
	cd "$srcdir/$_name-$pkgver"
	python setup.py install --root="$pkgdir" --optimize=1
	install -Dm644 enum/LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
