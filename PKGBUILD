# Contributor: Andreas Baumann <abaumann@yahoo.com>
# Contributor: Guillaume DUMOULIN <guillaume.dumoulin@gmail.com>
# Contributor: elsixdiab

pkgname=python-libconcord
_pkgsrcname=concordance
pkgver=1.2
pkgrel=1
pkgdesc='Python bindings for libconcord.'
arch=('any')
url='http://www.phildev.net/harmony/index.shtml'
license=('GPL3')
depends=('libconcord=1.2' 'python2')
source=("http://downloads.sourceforge.net/$_pkgsrcname/$_pkgsrcname-$pkgver.tar.bz2")
sha256sums=('ce9f23dfcd9bb1de79edd07231062c5e5d5fdefb3dd88ae6da7fb25b8d782434')

package() {
  cd "$srcdir/$_pkgsrcname-$pkgver/libconcord/bindings/python/"
  python2 setup.py install --root="$pkgdir/" --optimize=1
}

# vim:set ts=2 sw=2 et:
