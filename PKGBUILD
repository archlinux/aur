# Maintainer: Fabio Zanini <fabio.zanini _at_ fastmail.fm>
pkgname='python-scikit-bio'
pkgver=0.4.2
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
md5sums=('e4f60f4e91e5464ce2458589d7b3e915')

package() {
  cd "$srcdir/scikit-bio-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1
}

# vim:set ts=2 sw=2 et:
