_name=toml
pkgname=python-$_name
pkgver=0.9.4
pkgrel=1
pkgdesc='Parse and emit TOML'
arch=(any)
url="https://github.com/uiri/$_name"
license=(MIT)
depends=(python)
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=('8e86bd6ce8cc11b9620cb637466453d94f5d57ad86f17e98a98d1f73e3baab2d')

package() {
	cd "$_name-$pkgver"
	python setup.py install --root="$pkgdir" --optimize=1 || return 1
}
