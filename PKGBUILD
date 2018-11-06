# Maintainer: Philipp A. <flying-sheep@web.de>
_name=loompy
pkgname=python-loompy
pkgver=2.0.14
pkgrel=1
pkgdesc='Python implementation of the Loom file format for single-cell RNA-seq data'
arch=(any)
url='http://loompy.org/'
license=(BSD)
depends=(python-h5py python-scipy python-numpy)
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=('9ffc5e717d7932d72f80a301bef3a9a8d62b84ecf379c4b1ffd750f6b1388e88')

package() {
	cd "$srcdir/$_name-$pkgver"
	python setup.py install --root="$pkgdir" --optimize=1 || return 1
}
