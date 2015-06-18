# Maintainer: Levente Polyak <levente[at]leventepolyak[dot]net>
# Contributor: Andrey Mikhaylenko <neithere at gmail dot com>

pkgname=python-argcomplete
_pyname=argcomplete
pkgver=0.8.8
pkgrel=1
pkgdesc="easy, extensible command line tab completion of arguments for your Python script"
url="https://github.com/kislyuk/argcomplete"
arch=('any')
license=('Apache')
depends=('python')
makedepends=('python-distribute')
source=(https://github.com/kislyuk/${_pyname}/archive/v${pkgver}.tar.gz)
sha512sums=('835785b4da09930a85b8a8b08b03d99c172c0ac69c6c188122c36f6c5479369b5975d4bd806f32d0038e1351962b5c52d99ebe8c9fec43c14ab076282ccbfc22')

package() {
  cd ${_pyname}-${pkgver}
  python setup.py install -O1 --root="${pkgdir}"
}

# vim: ts=2 sw=2 et:
