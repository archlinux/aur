_name=umap-learn
pkgname=python-$_name
pkgver=0.4.6
pkgrel=1
pkgdesc='Uniform Manifold Approximation and Projection'
arch=(any)
url="https://github.com/lmcinnes/umap"
license=(BSD)
depends=(python-scipy python-scikit-learn python-numba)
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=('4276da9a039c79fa5b4f8d3515a8ccaaccf11a2f59ce8d15baf9d2015a5e82b3')

package() {
	cd "$_name-$pkgver"
	python setup.py install --root="$pkgdir" --optimize=1
}
