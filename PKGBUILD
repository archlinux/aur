# Maintainer: Tobias Bachmann <tobachmann@gmx.de>
pkgname=python-indexed-gzip
pkgver=0.8.2
pkgrel=2
pkgdesc="Drop-in replacement for the built-in python gzip.GzipFile class (IndexedGzipFile); written to allow fast random access of compressed NIfTI files"
_name=indexed_gzip
arch=('any')
url=""
license=('ZLIB')
groups=()
depends=('python' 'cython')
makedepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=(!emptydirs)
install=
# Switched from PyPi to GitHub due to persistent 404 errors
source=("https://github.com/pauldmccarthy/${_name}/archive/v${pkgver}.tar.gz")
sha256sums=('a9aff014cca1229e5cad299ad95a7fae14316ff6c5069bc5b119d76a45f900b6')

package() {
  cd "$srcdir/$_name-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1
}

# vim:set ts=2 sw=2 et:
