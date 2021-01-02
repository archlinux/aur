# Maintainer: Michal Wojdyla < micwoj9292 at gmail dot com >
# Contributor: arno <apithon.AT.free.DOT.fr>
# Contributor: Pierre Bourdon <delroth@gmail.com>
# Contributor: ianux <ianux AT free DOT fr>

pkgname=hachoir-core
pkgver=3.1.1
pkgrel=1
pkgdesc="A Python library to view and edit a binary stream field by field."
arch=('any')
url="https://pypi.org/project/hachoir/"
license=('GPL2')
depends=('python')
source=(https://github.com/vstinner/hachoir/archive/$pkgver.tar.gz)
md5sums=('717a008a9ecd5fef551e015f0478654a')

build() {
  cd ${srcdir}/hachoir-${pkgver}
  python setup.py build
}

package() {
  cd ${srcdir}/hachoir-${pkgver}
  python setup.py install --optimize=1 --root=${pkgdir}
}

