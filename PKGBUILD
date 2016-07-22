# Maintainer: Fabio Zanini <fabio.zanini _at_ fastmail.fm>
pkgname='python-scikit-bio'
pkgver=0.5.0
pkgrel=1
pkgdesc="Python package providing data structures, algorithms, and educational resources for bioinformatics"
arch=('x86_64')
url="https://github.com/biocore/scikit-bio"
license=('BSD')
groups=()
depends=('python' 'python-future' 'python-six' 'python-contextlib2' 'python-bz2file' 'python-requests' 'python-cachecontrol')
makedepends=('python-setuptools')
conflicts=()
replaces=()
backup=()
options=(!emptydirs)
install=
source=("https://github.com/biocore/scikit-bio/archive/${pkgver}.tar.gz")
md5sums=('4c170a2f70cc16bb30ba7281de594cb8')

package() {
  cd "$srcdir/scikit-bio-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1
}

# vim:set ts=2 sw=2 et:
