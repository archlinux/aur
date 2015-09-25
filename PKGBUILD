_name=altgraph
pkgname=python-altgraph
pkgver=0.12
pkgrel=1
pkgdesc='altgraph is a fork of graphlib: a graph (network) package for constructing graphs'
arch=('i686' 'x86_64')
url="https://pypi.python.org/pypi/$_name"
license=('MIT')
depends=('python2')
makedepends=('python2-distribute')
source=("https://pypi.python.org/packages/source/a/$_name/$_name-$pkgver.tar.gz")
sha256sums=('b90db0dba36d9ece282b6a95ae3d324b63239694ce2cf2fd07d3efd7f2f7cab2')

package() {
	cd "$srcdir/$_name-$pkgver"
	python setup.py install --root="$pkgdir" --optimize=1 || return 1
}
