# Maintainer: Philipp A. <flying-sheep@web.de>

_name=falcon-cors
pkgname=python-$_name
pkgver=1.1.7
pkgrel=1
pkgdesc='Falcon CORS middlware'
arch=(any)
url="https://github.com/dw/$_name"
license=(Apache)
depends=(python python-falcon)
makedepends=(python-setuptools)
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=('1788ec5c31b5a39240f7979a7c7170a33ea4952dc97e151858a82dcde1a9fe8a')

package() {
	cd "$srcdir/$_name-$pkgver"
	python setup.py install --root="$pkgdir" --optimize=1
}
