# Maintainer: Felix Buehler <account@buehler.de>
# based on script by: Samuel Mesa <samuelmesa@gmail.com>, Johannes Löthberg <johannes@kyriasis.com>

pkgname=python-mapnik-git
pkgver=3.0.16
pkgrel=1

pkgdesc="Python3 bindings for Mapnik"
url="https://github.com/mapnik/python-mapnik"
arch=('any')
license=('LGPL')

depends=('python' 'mapnik' 'python-cairo' 'python-pypdf2')
makedepends=('git' 'python-setuptools')

source=("git+https://github.com/mapnik/python-mapnik.git#branch=v3.0.x")
sha1sums=('SKIP')

package() {
	cd python-mapnik
	export PYCAIRO_NO_IMPORT
	python setup.py install --root="$pkgdir" --optimize=1
}

