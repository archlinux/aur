_name=toml
pkgname=python-$_name
pkgver=0.9.3.1
pkgrel=1
pkgdesc='Parse and emit TOML'
arch=('any')
url="https://github.com/uiri/$_name"
license=('MIT')
depends=('python')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
md5sums=('e5d32776ced9417c4149902d56a7302f')

package() {
	cd "$_name-${pkgver%.1}"
	python setup.py install --root="$pkgdir" --optimize=1 || return 1
}
