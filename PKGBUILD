# Maintainer: Philipp A. <flying-sheep@web.de>
_name=fpdf
pkgname=python-$_name
pkgver=1.7.2
pkgrel=1
pkgdesc='Simple PDF generation for Python'
arch=(any)
url='https://github.com/reingart/pyfpdf'
license=(GPL3)
depends=(python)
makedepends=(pandoc)
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=('125840783289e7d12552b1e86ab692c37322e7a65b96a99e0ea86cca041b6779')

package() {
	cd "$srcdir/$_name-$pkgver"
	python setup.py install --root="$pkgdir" --optimize=1 || return 1
}
