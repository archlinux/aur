# Maintainer: Philipp A. <flying-sheep@web.de>
_name=better_exchook
pkgname=python-$_name
pkgver=1.20190212.151715
pkgrel=1
pkgdesc='A nicer drop-in-replacement for Python sys.excepthook'
arch=(any)
url='https://github.com/albertz/py_better_exchook'
license=(BSD)
depends=(python)
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=('eaa8b9d1ff8e513f18d86debcf3bd24e473367379228cf2aff148e9b65eef000')

package() {
	cd "$srcdir/$_name-$pkgver"
	python setup.py install --root="$pkgdir" --optimize=1 || return 1
}
