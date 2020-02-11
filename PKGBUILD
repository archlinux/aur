# Maintainer: Parker Reed <parker.l.reed@gmail.com>
# Contributor: Andreas Baumann <abaumann@yahoo.com>
# Contributor: Guillaume DUMOULIN <guillaume.dumoulin@gmail.com>
# Contributor: elsixdiab

pkgname=python-libconcord
_pkgsrcname=concordance
pkgver=1.4
pkgrel=1
pkgdesc='Python bindings for libconcord.'
arch=('any')
url='http://www.phildev.net/harmony/index.shtml'
license=('GPL3')
depends=('libconcord=1.4' 'python')
source=("https://github.com/jaymzh/$_pkgsrcname/releases/download/v$pkgver/$_pkgsrcname-$pkgver.tar.bz2")
sha256sums=('e7484707926393c2b44ae5e21e978a597c0f50e210e13b9e1e8168e1476382c7')

package() {
  cd "$srcdir/$_pkgsrcname-$pkgver/libconcord/bindings/python/"
  python setup.py install --root="$pkgdir/" --optimize=1
}

# vim:set ts=2 sw=2 et:
