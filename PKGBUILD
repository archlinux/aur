# Maintainer: monosans

pkgname=djlint
pkgver=0.7.4
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
sha256sums=('aad18147db996cb93d63493126ad29d13251f60e6e45f98ab0e9b6252875ccf0')

package() {
	cd "$srcdir/$pkgname-$pkgver"
	python setup.py install --root="$pkgdir" --optimize=1
}
# vim:set ts=4 sw=4 noet:
