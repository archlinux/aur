# Maintainer: monosans

pkgname=djlint
pkgver=0.7.5
pkgrel=1
pkgdesc='HTML Template Linter and Formatter'
url=https://github.com/Riverside-Healthcare/djLint
arch=(any)
license=(GPL3)
makedepends=(python-setuptools)
depends=(
	python
	python-click
	python-yaml
	python-colorama
	python-regex
	python-tqdm
	python-tomlkit
	python-pathspec
	python-importlib-metadata)
source=("https://files.pythonhosted.org/packages/source/${pkgname::1}/${pkgname}/${pkgname}-${pkgver}.tar.gz")
sha256sums=('c6426a77bfae4dadb90034f0a000c2229ab7d17a7e3853a2218f724e07c40da4')

package() {
	cd "$srcdir/$pkgname-$pkgver"
	python setup.py install --root="$pkgdir" --optimize=1
}
# vim:set ts=4 sw=4 noet:
