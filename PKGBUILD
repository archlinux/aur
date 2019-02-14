# Maintainer: Fabio Zanini <fabio.zanini _at_ fastmail.fm>
pkgname='python-scikit-bio'
pkgver=0.5.5
pkgrel=2
pkgdesc="Python package providing data structures, algorithms, and educational resources for bioinformatics"
arch=('x86_64')
url="https://github.com/biocore/scikit-bio"
license=('BSD')
groups=()
depends=('python' 'python-future' 'python-decorator' 'python-six' 'python-contextlib2' 'python-natsort' 'python-bz2file' 'python-lockfile' 'python-pandas' 'python-scipy' 'python-numpy' 'python-matplotlib' 'python-requests' 'python-cachecontrol' 'python-msgpack')
makedepends=('python-setuptools')
conflicts=()
replaces=()
backup=()
options=(!emptydirs)
install=
source=("https://github.com/biocore/scikit-bio/archive/${pkgver}.tar.gz")
md5sums=('e8ec41366d9eeda9bce3ec43c2af1159')

package() {
  cd "$srcdir/scikit-bio-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1
}

# vim:set ts=2 sw=2 et:
