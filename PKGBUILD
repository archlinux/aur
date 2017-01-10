# Maintainer: Philipp A. <flying-sheep@web.de>
_name=anglerfish
pkgname=python-$_name
pkgver=2.2.0
pkgrel=1
pkgdesc='Helper library for Python 3 apps'
arch=('any')
url="http://pypi.python.org/pypi/$_name"
license=('GPLv3')
depends=('python')
_wheel="$_name-$pkgver-py2.py3-none-any.whl"
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
md5sums=('c927a8d39fc9181b817a77b0774deb5d')

package() {
	cd "$srcdir/$_name-$pkgver"
	python setup.py install --root="$pkgdir" --optimize=1
}
