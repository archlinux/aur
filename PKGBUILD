# Maintainer: Parker Reed <parker.l.reed@gmail.com>
# Contributor: Andreas Baumann <abaumann@yahoo.com>
# Contributor: Guillaume DUMOULIN <guillaume.dumoulin@gmail.com>
# Contributor: elsixdiab

pkgname=python-libconcord
_pkgsrcname=concordance
pkgver=1.5
pkgrel=1
pkgdesc='Python bindings for libconcord.'
arch=('any')
url='https://github.com/jaymzh/concordance/'
license=('GPL3')
depends=('libconcord=1.5' 'python')
source=("https://github.com/jaymzh/$_pkgsrcname/releases/download/v$pkgver/$_pkgsrcname-$pkgver.tar.bz2")
sha256sums=('6e4ecfc18b91586cc0c58e376a7e23a561cbd7e8756586e62d5d9450e1b42b25')

package() {
  cd "$srcdir/$_pkgsrcname-$pkgver/libconcord/bindings/python/"
  python setup.py install --root="$pkgdir/" --optimize=1
}

# vim:set ts=2 sw=2 et:
