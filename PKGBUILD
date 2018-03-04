_name=altgraph
pkgname=python-altgraph
pkgver=0.15
pkgrel=1
pkgdesc='altgraph is a fork of graphlib: a graph (network) package for constructing graphs'
arch=(any)
url="https://pypi.python.org/pypi/$_name"
license=(MIT)
depends=(python)
makedepends=(python-setuptools)
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=('fc28b986a68fde8d3ff0e6d6ba3fbdd2cd562d11d45ef7c7735fbd826c9eec2e')

package() {
	cd "$srcdir/$_name-$pkgver"
	python setup.py install --root="$pkgdir" --optimize=1 || return 1
}
