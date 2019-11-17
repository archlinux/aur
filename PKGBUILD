# Maintainer: Fabio Zanini <fabio.zanini@fastmail.fm>
_name=ternary
pkgname=python-ternary
pkgver=1.0.6
pkgrel=1
pkgdesc='Ternary plotting library for python with matplotlib'
arch=(any)
url='https://github.com/marcharper/python-ternary/'
license=(BSD)
depends=(python-matplotlib python-scipy python-numpy)
source=("https://github.com/marcharper/python-ternary/archive/$pkgver.tar.gz")
sha256sums=('645e7b746e4397a5e0a37eab7172e7e4abe5285604b18b2bf25338568e5ff53c')

package() {
	cd "$srcdir/$pkgname-$pkgver"
	python setup.py install --root="$pkgdir" --optimize=1 || return 1
}
