_name=ucnum
pkgname="python-$_name"
pkgver=1.1
pkgrel=1
pkgdesc='Unicode helper and search utility'
arch=('any')
url="http://github.com/flying-sheep/$_name"
license=('GPLv3')
depends=('python' 'python-unicodeblocks')
optdepends=('python-unicodedata2: Updated unicodedata')
source=("https://pypi.python.org/packages/source/u/$_name/$_name-$pkgver.tar.gz")
md5sums=('d67f0e2e203e39df140f70cb2046193d')

package() {
	cd "$srcdir/$_name-$pkgver"
	python setup.py install --root="$pkgdir" --optimize=1
}