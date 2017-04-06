# Maintainer: Samuel Mesa <samuelmesa@gmail.com>
# based on script by: Johannes Löthberg <johannes@kyriasis.com>

pkgname=python-mapnik
pkgver=3.0.13
pkgrel=1

pkgdesc="Python3 bindings for Mapnik"
url="https://github.com/mapnik/python-mapnik"
arch=('any')
license=('LGPL')

depends=('python' 'mapnik' 'python-cairo' 'python-pypdf2')
makedepends=('python-setuptools')

source=("https://github.com/mapnik/python-mapnik/archive/v$pkgver.tar.gz")
sha1sums=('0b60b471fb2afad080e703cf3ceae72e31633344')

package() {
	cd python-mapnik-$pkgver
	PYCAIRO=true python setup.py install --root="$pkgdir" --optimize=1
}

