# Maintainer: Fabio Zanini <fabio.zanini _at_ stanford.edu>
pkgname='python-hdbscan'
pkgver=0.8.4
pkgrel=1
pkgdesc="Hierarchical Density-Based Spatial Clustering of Applications with Noise"
arch=('x86_64')
url="http://github.com/scikit-learn-contrib/hdbscan"
license=('BSD')
groups=()
depends=('python' 'python-scikit-learn>=0.16')
makedepends=('python-setuptools' 'cython>=0.17')
options=(!emptydirs)
source=("https://pypi.python.org/packages/41/ee/1cadaa1059fce788e2c2061d05ddd153b8253b6db17728f4d161db07423d/hdbscan-${pkgver}.tar.gz")
md5sums=('e59a35caa0dc416b211026f11eff6d1d')

package() {
  cd "$srcdir/hdbscan-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1
}

# vim:set ts=2 sw=2 et:
