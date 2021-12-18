_name=altgraph
pkgname=python-altgraph
pkgver=0.17.2
pkgrel=1
pkgdesc='A graph (network) package for constructing graphs, BFS and DFS traversals, topological sort, shortest paths, etc. with graphviz output.'
arch=(any)
url="https://pypi.python.org/pypi/$_name"
license=(MIT)
depends=(python)
makedepends=(python-setuptools)
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=('ebf2269361b47d97b3b88e696439f6e4cbc607c17c51feb1754f90fb79839158')

package() {
	cd "$srcdir/$_name-$pkgver"
	python setup.py install --root="$pkgdir" --optimize=1 || return 1
}
