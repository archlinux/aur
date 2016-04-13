_name=toml
pkgname=python-$_name
pkgver=0.9.1
pkgrel=1
pkgdesc='Parse and emit TOML'
arch=('any')
url="https://github.com/uiri/$_name"
license=('MIT')
depends=('python')
source=("https://pypi.python.org/packages/source/t/$_name/$_name-$pkgver.tar.gz")
md5sums=('06a5f56f3db07a459ac9d6812d051530')

package() {
	cd "$_name-$pkgver"
	python setup.py install --root="$pkgdir" --optimize=1 || return 1
}
