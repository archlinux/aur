# Maintainer: Philipp A. <flying-sheep@web.de>
_name=loompy
pkgname=python-loompy
pkgver=2.0.17
pkgrel=1
pkgdesc='Python implementation of the Loom file format for single-cell RNA-seq data'
arch=(any)
url='http://loompy.org/'
license=(BSD)
depends=(python-h5py python-scipy python-numpy)
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=('fa608019cb29569704fefb07486f579e21bfc4dc5949fdf56b8e1b31ee6b2982')

package() {
	cd "$srcdir/$_name-$pkgver"
	python setup.py install --root="$pkgdir" --optimize=1 || return 1
}
