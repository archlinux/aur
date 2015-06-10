# Contributor: arno <apithon.AT.free.DOT.fr>
# Contributor: Pierre Bourdon <delroth@gmail.com>
# Maintainer: ianux <ianux AT free DOT fr>

pkgname=hachoir-core
pkgver=1.3.3
pkgrel=4
pkgdesc="A library written in Python which allows to see and edit a binary files field per field."
arch=('any')
url="http://bitbucket.org/haypo/hachoir/wiki/Home"
license=('GPL2')
depends=('python2')
source=(http://cheeseshop.python.org/packages/source/h/$pkgname/$pkgname-$pkgver.tar.gz)
md5sums=('b80f0257536e2b2cb23f66670c4f6f31')

build() {
  cd ${srcdir}/${pkgname}-${pkgver}
  python2 setup.py build
}

package() {
  cd ${srcdir}/${pkgname}-${pkgver}
  python2 setup.py install --optimize=1 --root=${pkgdir}
}

