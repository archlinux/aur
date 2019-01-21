# Maintainer: Philipp A. <flying-sheep@web.de>
_name=better_exchook
pkgname=python-$_name
pkgver=1.20190103.160956
pkgrel=1
pkgdesc='A nicer drop-in-replacement for Python sys.excepthook'
arch=(any)
url='https://github.com/albertz/py_better_exchook'
license=(BSD)
depends=(python)
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=('ec7541608f0c30f9983f2d517702902cce00f4fa6f65c89e51bbe6034e29cdd5')

package() {
	cd "$srcdir/$_name-$pkgver"
	python setup.py install --root="$pkgdir" --optimize=1 || return 1
}
