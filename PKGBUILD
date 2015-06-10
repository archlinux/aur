# Contributor: arno <apithon.AT.free.DOT.fr>
# Contributor: Pierre Bourdon <delroth@gmail.com>
# Maintainer: ianux <ianux AT free DOT fr>

pkgname=hachoir-parser
pkgver=1.3.4
pkgrel=4
pkgdesc="Most common file format parsers written using hachoir-core."
arch=('any')
url="http://bitbucket.org/haypo/hachoir/wiki/hachoir-parser"
license=('GPL2')
depends=('hachoir-core')
source=(http://cheeseshop.python.org/packages/source/h/$pkgname/$pkgname-$pkgver.tar.gz)
md5sums=('e578b779c4b30d94ca4e775747877755')

build() {
  cd ${srcdir}/${pkgname}-${pkgver}
  python2 setup.py build
}

package() {
  cd ${srcdir}/${pkgname}-${pkgver}
  python2 setup.py install --optimize=1 --root=${pkgdir}
}
