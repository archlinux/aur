_name=altgraph
pkgname=python-altgraph
pkgver=0.17
pkgrel=1
pkgdesc='altgraph is a fork of graphlib: a graph (network) package for constructing graphs'
arch=(any)
url="https://pypi.python.org/pypi/$_name"
license=(MIT)
depends=(python)
makedepends=(python-setuptools)
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=('1f05a47122542f97028caf78775a095fbe6a2699b5089de8477eb583167d69aa')

package() {
	cd "$srcdir/$_name-$pkgver"
	python setup.py install --root="$pkgdir" --optimize=1 || return 1
}
