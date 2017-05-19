# Maintainer: Philipp A. <flying-sheep@web.de>
_name=anglerfish
pkgname=python-$_name
pkgver=2.5.0
pkgrel=1
pkgdesc='Helper library for Python 3 apps'
arch=('any')
url="http://pypi.python.org/pypi/$_name"
license=('GPLv3')
depends=('python')
_wheel="$_name-$pkgver-py2.py3-none-any.whl"
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.zip")
md5sums=('8f55508b1efc21603edf2fe49fa06595')

package() {
	cd "$srcdir/$_name-$pkgver"
	python setup.py install --root="$pkgdir" --optimize=1
}
