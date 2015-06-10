# Maintainer: ianux <ianux AT free DOT fr>

pkgname=hachoir-wx
pkgver=0.3
pkgrel=2
pkgdesc="Graphical user interface for hachoir."
arch=('i686' 'x86_64')
url="http://bitbucket.org/haypo/hachoir/wiki/hachoir-metadata"
license=('GPL2')
depends=('hachoir-core' 'hachoir-parser' 'wxpython')
source=(http://cheeseshop.python.org/packages/source/h/$pkgname/$pkgname-$pkgver.tar.gz)
md5sums=('ad957029c165d9ba52a6f1ebf92ea647')

build() {
  cd ${srcdir}/${pkgname}-${pkgver}
  python2 setup.py build
}

package() {
  cd ${srcdir}/${pkgname}-${pkgver}
  python2 setup.py install --optimize=1 --root=${pkgdir}
}
