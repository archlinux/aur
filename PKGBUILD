# Maintainer: Tobias Bachmann <tobachmann@gmx.de>
pkgname=python-indexed-gzip
pkgver=1.6.13
pkgrel=1
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
sha256sums=('025f0c281da965ea1a48a0340f7ede8ae4f400911240c3072df3f210fa8a6756')

package() {
  cd "$srcdir/$_name-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1
}

# vim:set ts=2 sw=2 et:
