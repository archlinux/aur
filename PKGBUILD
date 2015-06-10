# Contributor: arno <apithon.AT.free.DOT.fr>
# Maintainer: ianux <ianux AT free DOT fr>

pkgname=hachoir-subfile
pkgver=0.5.3
pkgrel=4
pkgdesc="A tool based on hachoir-parser to find subfiles in any binary stream."
arch=('any')
url="http://bitbucket.org/haypo/hachoir/wiki/hachoir-regex"
license=('GPL2')
depends=('hachoir-core' 'hachoir-parser' 'hachoir-regex')
source=(http://cheeseshop.python.org/packages/source/h/$pkgname/$pkgname-$pkgver.tar.gz)
md5sums=('74ff4f86f8ecbc864b6c8a84cbc8164f')

build() {
  cd ${srcdir}/${pkgname}-${pkgver}
  python2 setup.py build
}

package() {
  cd ${srcdir}/${pkgname}-${pkgver}
  python2 setup.py install --optimize=1 --root=${pkgdir}
}
