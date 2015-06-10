# Contributor: arno <apithon.AT.free.DOT.fr>
# Maintainer: ianux <ianux AT free DOT fr>

pkgname=hachoir-urwid
pkgver=1.1
pkgrel=4
pkgdesc="User interface based on hachoir-parser to explore a binary file."
arch=('any')
url="http://bitbucket.org/haypo/hachoir/wiki/hachoir-regex"
license=('GPL2')
depends=('hachoir-core' 'hachoir-parser' 'python2-urwid')
source=(http://cheeseshop.python.org/packages/source/h/$pkgname/$pkgname-$pkgver.tar.gz)
md5sums=('71957e421578168093fd6ba1f0e64e34')

build() {
  cd ${srcdir}/${pkgname}-${pkgver}
  python2 setup.py build
}

package() {
  cd ${srcdir}/${pkgname}-${pkgver}
  python2 setup.py install --optimize=1 --root=${pkgdir}
}
