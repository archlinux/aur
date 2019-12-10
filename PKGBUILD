# Maintainer: Philipp A. <flying-sheep@web.de>

_name=profimp
pkgname=python-$_name
pkgver=0.1.0
pkgrel=1
pkgdesc='generates tree of import profiles'
arch=(any)
url="https://github.com/boris-42/$_name"
license=(Apache)
depends=(python-pbr)
makedepends=(python-setuptools)
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=('d18e0145e131092a5d467e3a04a9034064856dfd5e1860ed6354dd844c9e0d54')

package() {
	cd "$srcdir/$_name-$pkgver"
	python setup.py install --root="$pkgdir" --optimize=1
}
