_name=toml
pkgname=python-$_name
pkgver=0.9.2
pkgrel=1
pkgdesc='Parse and emit TOML'
arch=('any')
url="https://github.com/uiri/$_name"
license=('MIT')
depends=('python')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
md5sums=('910a9573116c91d63e132741183c8a80')

package() {
	cd "$_name-$pkgver"
	python setup.py install --root="$pkgdir" --optimize=1 || return 1
}
