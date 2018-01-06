# $Id: PKGBUILD 153802 2015-12-20 20:18:40Z idevolder $
# Maintainer: BlackEagle < ike DOT devolder AT gmail DOT com >
pkgname=closure-linter
pkgver=2.3.19
pkgrel=1
pkgdesc="A JavaScript style checker and style fixer"
arch=('any')
url="https://developers.google.com/closure/utilities/"
license=('APACHE')
depends=('python2-gflags' 'python2-setuptools')
source=("$pkgname-$pkgver.tar.gz::https://github.com/google/$pkgname/archive/v$pkgver.tar.gz")
sha256sums=('cd472f560be5af80afccbe94c9d9b534f7c30085510961ad408f8a314ea5c4c2')

build() {
	cd "$pkgname-$pkgver"
	python2 setup.py build
}

package() {
	cd "$pkgname-$pkgver"
	python2 setup.py install --root="$pkgdir"
}
