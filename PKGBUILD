# Maintainer: atomicbeef <teddyg522@gmail.com>

pkgname=python-tdl
pkgver=1.5.3
pkgrel=3
pkgdesc="Pythonic CFFI port of libtcod."
arch=('any')
url="https://pypi.python.org/pypi/tdl"
license=('BSD')
depends=('python' 'python-cffi' 'python-libtcod-cffi')
source=("https://github.com/HexDecimal/$pkgname/archive/v.$pkgver.tar.gz")
md5sums=('b5b1bf0fd665587b3c20dc44aa5a3741')

package() {
	cd "${pkgname}-v.$pkgver"
    python setup.py install --root="$pkgdir/" --optimize=1
}
