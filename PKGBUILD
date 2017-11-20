# Maintainer: Phil Schaf <flying-sheep@web.de>

_name=anndata
pkgname=python-$_name
pkgver=0.3.1
pkgrel=1
pkgdesc='A data structure for rectangular numeric data and sample/variable annotations.'
arch=(any)
url="https://github.com/theislab/$_name"
license=(GPL3)
depends=(python-pandas python-scipy)
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
md5sums=('188f68b5f4f8a848bc131321b874d185')

package() {
	cd "$srcdir/$_name-$pkgver"
	python setup.py install --prefix=/usr --root="$pkgdir" --optimize=1
}
