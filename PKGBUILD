# Contributor: Andreas Baumann <abaumann@yahoo.com>
# Contributor: Guillaume DUMOULIN <guillaume.dumoulin@gmail.com>
# Contributor: elsixdiab

pkgname=congruity
pkgver=20
pkgrel=1
pkgdesc='A GUI application for programming Logitech(R) Harmony(TM) remote controls.'
arch=('any')
url='http://congruity.sourceforge.net/'
license=('GPL3')
depends=('python-libconcord>=1.1' 'python-six' 'python-suds' 'python-wxpython')
install="$pkgname.install"
source=("http://downloads.sourceforge.net/project/$pkgname/$pkgname/$pkgver/$pkgname-$pkgver.tar.bz2")
sha256sums=('50f28e584ba6710cc803a6a27b103f65cca83f0a130165154597e5322c6790c1')

package() {
  cd "$srcdir/$pkgname-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1
}

# vim:set ts=2 sw=2 et:
