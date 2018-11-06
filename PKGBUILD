_name=altgraph
pkgname=python-altgraph
pkgver=0.16.1
pkgrel=1
pkgdesc='altgraph is a fork of graphlib: a graph (network) package for constructing graphs'
arch=(any)
url="https://pypi.python.org/pypi/$_name"
license=(MIT)
depends=(python)
makedepends=(python-setuptools)
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=('ddf5320017147ba7b810198e0b6619bd7b5563aa034da388cea8546b877f9b0c')

package() {
	cd "$srcdir/$_name-$pkgver"
	python setup.py install --root="$pkgdir" --optimize=1 || return 1
}
