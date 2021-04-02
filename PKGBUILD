# Maintainer: Twann <twann@ctemplar.com>

pkgname=mxl
pkgver=1.0.5
pkgrel=2
provides=("$pkgname")
pkgdesc="Delete sensitive files in panic situations"
url="https://codeberg.org/twann/$pkgname"
arch=("any")
license=("MIT")
makedepends=()
depends=("python>=3" "python-setuptools" "python-colorama")
source=("${pkgname}-${pkgver}.tar.gz::https://codeberg.org/twann/mxl/archive/$pkgver.tar.gz")
sha512sums=("de89f7be8a2cee3558b5487d1a73acf23ff7ebc4fa3964627303e1760d7719413df59944472e0f8f161f86a97b0072eb3217ed90b49d014c85a4ea55180f4b8d")

package()
{	
	cd "$srcdir/$pkgname"
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
	python setup.py install --root="$pkgdir"
}


