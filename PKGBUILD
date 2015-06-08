_name=unicodedata2
pkgname="python-$_name"
pkgver=7.0.0
pkgrel=1
pkgdesc='unicodedata backport/updates'
arch=('i686' 'x86_64')
url="https://github.com/mikekap/$_name"
license=('Apache')
depends=('python')
source=("https://pypi.python.org/packages/source/u/$_name/$_name-$pkgver.tar.gz")
md5sums=('0ab10f4b8c669d47eaec340510da7dce')

package() {
	cd "$srcdir/$_name-$pkgver"
	python setup.py install --root="$pkgdir" --optimize=1
}