# Maintainer: Fabio Zanini <fabio.zanini@fastmail.fm>
_name=ternary
pkgname=python-ternary
pkgver=1.0.8
pkgrel=1
pkgdesc='Ternary plotting library for python with matplotlib'
arch=(any)
url='https://github.com/marcharper/python-ternary/'
license=(BSD)
depends=(python-matplotlib python-scipy python-numpy)
source=($pkgname-$pkgver.tar.gz::"https://github.com/marcharper/python-ternary/archive/$pkgver.tar.gz")
sha256sums=('e432a299fee9edc56c627df69504f00f978a7f6dbeeacb2e5a3d6b45bb56f819')

package() {
	cd "$srcdir/$pkgname-$pkgver"
	python setup.py install --root="$pkgdir" --optimize=1
}
