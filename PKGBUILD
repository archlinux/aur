# Maintainer: Phil Schaf <flying-sheep@web.de>

_name=anndata
pkgname=python-$_name
pkgver=0.3.0.1
pkgrel=2
pkgdesc='A data structure for rectangular numeric data and sample/variable annotations.'
arch=(any)
url="https://github.com/theislab/$_name"
license=(GPL3)
depends=(python-pandas python-scipy)
source=("$_name-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz")
md5sums=('17f4ff5991142aab4591417b4185989a')

package() {
	cd "$srcdir/$_name-$pkgver"
	python setup.py install --prefix=/usr --root="$pkgdir" --optimize=1
}
