# Maintainer: Phil Schaf <flying-sheep@web.de>
_name=modulegraph
pkgname=python-modulegraph
pkgver=0.12.1
pkgrel=1
pkgdesc='determines a dependency graph between Python modules primarily by bytecode analysis for import statements'
arch=('any')
url="https://bitbucket.org/ronaldoussoren/modulegraph"
license=('')
depends=('python')
source=("https://pypi.python.org/packages/source/m/$_name/$_name-$pkgver.tar.gz")
md5sums=('27abd74de3ec0e22ef129c1faa628bd5')

package() {
	cd "$srcdir/$_name-$pkgver"
	python setup.py install --root="$pkgdir" --optimize=1 || return 1
}