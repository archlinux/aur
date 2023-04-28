# Contributor: Andreas Baumann <abaumann@yahoo.com>
# Contributor: Guillaume DUMOULIN <guillaume.dumoulin@gmail.com>
# Contributor: elsixdiab

pkgname=congruity
pkgver=21
pkgrel=1
pkgdesc='A GUI application for programming Logitech(R) Harmony(TM) remote controls.'
arch=('any')
url='http://congruity.sourceforge.net/'
license=('GPL3')
depends=('python-libconcord>=1.1' 'python-six' 'python-suds' 'python-wxpython')
install="$pkgname.install"
source=("http://downloads.sourceforge.net/project/$pkgname/$pkgname/$pkgver/$pkgname-$pkgver.tar.bz2")
sha256sums=('c5217861fd18c2c0fd1dfe8c8e6f66566a5f947930dd1b60cf261fffb8278586')

package() {
  cd "$srcdir/$pkgname-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1
}

# vim:set ts=2 sw=2 et:
