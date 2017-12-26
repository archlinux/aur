# Maintainer: Gunther Cox <gunthercx at gmail dot com>
# Contributor: tembleking <tembleking at gmail dot com>

pkgname=('python-jsondatabase' 'python2-jsondatabase')
pkgver=0.1.7
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


md5sums=('f5375175d6af9d010eed2f8b29189015')
sha1sums=('d37c2f9744f3d97582ec6601068fdd3fe7b34229')
sha256sums=('0d087fd6c2e7cf025a318755d2ade80bb416039fc013375f7a284fc3700e6ea9')
sha512sums=('37e207efc24aef87f086bd1f154059295234deeb2820a50b08e00afcd41c0066d1e0ffac21fc671bd41eee7a7fd342d20abc5c6c0e2131a647ad65c8d9121ac1')
