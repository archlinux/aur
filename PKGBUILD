# Contributor: arno <apithon.AT.free.DOT.fr>
# Contributor: Pierre Bourdon <delroth@gmail.com>
# Maintainer: ianux <ianux AT free DOT fr>

pkgname=hachoir-regex
pkgver=1.0.5
pkgrel=2
pkgdesc="Regex manipulation Python library used by hachoir-subfile for fast pattern matching."
arch=('any')
url="http://bitbucket.org/haypo/hachoir/wiki/hachoir-regex"
license=('GPL2')
depends=('python2')
source=(http://cheeseshop.python.org/packages/source/h/$pkgname/$pkgname-$pkgver.tar.gz)
md5sums=('6e1430cc5efcf82b6895364a6bf36d11')

build() {
  cd ${srcdir}/${pkgname}-${pkgver}
  python2 setup.py build
}

package() {
  cd ${srcdir}/${pkgname}-${pkgver}
  python2 setup.py install --optimize=1 --root=${pkgdir}
}
