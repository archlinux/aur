# Maintainer: Richard Tucker <rtucker@mookins.com>
pkgname=python-textparser
provides=('python-textparser')
pkgdesc="A text parser written in the Python language."
url="https://github.com/eerimoq/textparser"
pkgver=0.23.0
pkgrel=1
arch=('any')
license=('MIT')
depends=('python')
makedepends=('python-setuptools')

source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz")
sha512sums=('dbbe3181317a26ccf7623c8319b8063d189d8800e02ea3524d3d4ae04e28be4f9896361fc5fac56858fb95bf0674cafece3fb0b51748c3bbb67ec2f6d5f8c9fd')

package() {
	cd "textparser-$pkgver"
	python setup.py install --root="$pkgdir" --optimize=1
}
