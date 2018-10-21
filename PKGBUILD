# Maintainer: Samuel Mesa <samuelmesa@gmail.com>
# based on script by: Johannes Löthberg <johannes@kyriasis.com>

pkgname=python-mapnik
pkgver=3.0.16
pkgrel=2

pkgdesc="Python3 bindings for Mapnik"
url="https://github.com/mapnik/python-mapnik"
arch=('any')
license=('LGPL')

depends=('python' 'mapnik' 'python-cairo' 'python-pypdf2')
makedepends=('python-setuptools')

source=("https://github.com/mapnik/python-mapnik/archive/v$pkgver.tar.gz")
sha1sums=('8e30049954b14282667677a5d5a145eddedfc8df')

package() {
	cd python-mapnik-$pkgver
	export PYCAIRO_NO_IMPORT
	python setup.py install --root="$pkgdir" --optimize=1
}

