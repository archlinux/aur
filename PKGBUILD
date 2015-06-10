# Contributor: arno <apithon.AT.free.DOT.fr>
# Contributor: Pierre Bourdon <delroth@gmail.com>
# Maintainer: ianux <ianux AT free DOT fr>

pkgname=hachoir-metadata
pkgver=1.3.3
pkgrel=4
pkgdesc="A tool to extract metadata from multimedia files."
arch=('any')
url="http://bitbucket.org/haypo/hachoir/wiki/hachoir-metadata"
license=('GPL2')
depends=('hachoir-core' 'hachoir-parser')
source=(http://cheeseshop.python.org/packages/source/h/$pkgname/$pkgname-$pkgver.tar.gz)
md5sums=('26e04a2395205d31469fc2d6935055a9')

build() {
  cd ${srcdir}/${pkgname}-${pkgver}
  python2 setup.py build
}

package() {
  cd ${srcdir}/${pkgname}-${pkgver}
  python2 setup.py install --optimize=1 --root=${pkgdir}
}
