# Maintainer: Fabio Zanini <fabio.zanini _at_ stanford.edu>
pkgname=python-hdbscan
pkgver=0.8.19
pkgrel=1
pkgdesc='Hierarchical Density-Based Spatial Clustering of Applications with Noise'
arch=('x86_64')
url='http://github.com/scikit-learn-contrib/hdbscan'
license=('BSD')
groups=()
depends=('python' 'python-scikit-learn>=0.16')
makedepends=('python-setuptools' 'cython>=0.17')
options=(!emptydirs)
source=("https://files.pythonhosted.org/packages/22/8d/1fc4bfd17ae871441fd6440abc3da5fdecf34831aa711e3e52727ab00556/hdbscan-${pkgver}.tar.gz")
sha256sums=('7bd74c7bd16540d7f437cf6cb61ceb4d23506f4d040c436d7570d104c1297e31')

package() {
  cd "$srcdir/hdbscan-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1
}

# vim:set ts=2 sw=2 et:
