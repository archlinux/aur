# Maintainer: Philipp A. <flying-sheep@web.de>
_name=better_exchook
pkgname=python-$_name
pkgver=1.20210525.222418
pkgrel=1
pkgdesc='A nicer drop-in-replacement for Python sys.excepthook'
arch=(any)
url='https://github.com/albertz/py_better_exchook'
license=(BSD)
depends=(python)
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=('ffc59f7b18a55883680962dd4d56b7042c59d9e8daccd68a146b25def2583c0e')

package() {
	cd "$srcdir/$_name-$pkgver"
	python setup.py install --root="$pkgdir" --optimize=1 || return 1
}
