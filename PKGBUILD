# Maintainer: Gunther Cox <gunthercx at gmail dot com>
# Contributor: tembleking <tembleking at gmail dot com>

pkgname=('python-jsondatabase' 'python2-jsondatabase')
pkgver=0.1.6
pkgrel=1
pkgdesc="A flat file database for json objects."
arch=("any")
url="https://github.com/gunthercox/jsondb"
license=('BSD')
makedepends=("python-setuptools" "python2-setuptools")
source=("https://github.com/gunthercox/jsondb/archive/$pkgver.tar.gz")


package_python-jsondatabase() {
	depends=("python")
	cd "jsondb-$pkgver"
	python setup.py install --root="$pkgdir" --optimize=1
}

package_python2-jsondatabase() {
	depends=("python2")
	cd "jsondb-$pkgver"
	python2 setup.py install --root="$pkgdir" --optimize=1
}


md5sums=('466106a62ab918209de1be3d9d951ce3')
