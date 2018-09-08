# Contributor: Andreas Baumann <abaumann@yahoo.com>
# Contributor: Guillaume DUMOULIN <guillaume.dumoulin@gmail.com>
# Contributor: elsixdiab

pkgname=python-libconcord
_pkgsrcname=concordance
pkgver=1.3
pkgrel=1
pkgdesc='Python bindings for libconcord.'
arch=('any')
url='http://www.phildev.net/harmony/index.shtml'
license=('GPL3')
depends=('libconcord=1.3' 'python')
source=("https://github.com/jaymzh/$_pkgsrcname/releases/download/v$pkgver/$_pkgsrcname-$pkgver.tar.bz2")
sha256sums=('bd0d1a7cc3aca0276cc02ee1bc7cf30b44f0b84a5edcac862844b83f789ccb8a')

package() {
  cd "$srcdir/$_pkgsrcname-$pkgver/libconcord/bindings/python/"
  python setup.py install --root="$pkgdir/" --optimize=1
}

# vim:set ts=2 sw=2 et:
