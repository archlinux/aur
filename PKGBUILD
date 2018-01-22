# Maintainer: Samuel Mesa <samuelmesa@gmail.com>
# based on script by: Johannes Löthberg <johannes@kyriasis.com>

pkgname=python2-mapnik
pkgver=3.0.16
pkgrel=1

pkgdesc="Python2 bindings for Mapnik"
url="https://github.com/mapnik/python-mapnik"
arch=('any')
license=('LGPL')
depends=('python2' 'mapnik' 'python2-cairo' 'python2-pypdf2')
makedepends=('python2-setuptools')
source=("https://github.com/mapnik/python-mapnik/archive/v$pkgver.tar.gz")
sha1sums=('8e30049954b14282667677a5d5a145eddedfc8df')

package() {
	cd python-mapnik-$pkgver
	PYCAIRO=true python2 setup.py install --root="$pkgdir" --optimize=1
}

