_name=umap-learn
pkgname=python-$_name
pkgver=0.3.9
pkgrel=1
pkgdesc='Uniform Manifold Approximation and Projection'
arch=(any)
url="https://github.com/lmcinnes/umap"
license=(BSD)
depends=(python-scipy python-scikit-learn python-numba)
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=('1afa7036b84c30a466c03d16fabbcda42fe1bea8faebb0cc1e9b2ac3ea28a19c')

package() {
	cd "$_name-$pkgver"
	python setup.py install --root="$pkgdir" --optimize=1 || return 1
}
