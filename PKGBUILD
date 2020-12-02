# Maintainer: Will Handley <wh260@cam.ac.uk> (aur.archlinux.org/account/wjhandley)
_modulename=kmapper
pkgname=python-$_modulename
pkgver=1.2.0
pkgrel=2
pkgdesc="Kepler Mapper: A flexible Python implementation of the Mapper algorithm"
arch=(any)
url="https://github.com/scikit-tda/kepler-mapper"
license=('MIT')
groups=()
depends=('python' 'python-numpy' 'python-scikit-learn')
makedepends=('python-setuptools' 'cython')
provides=()
conflicts=()
replaces=()
backup=()
options=(!emptydirs)
install=
source=("${url}/archive/${pkgver}.tar.gz")
sha256sums=('3240183d4388ab43d8cf6578c2b83449ed58dff71fa65978a2d865a974c99766')
package() {
  cd "$srcdir/kepler-mapper-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1
}
