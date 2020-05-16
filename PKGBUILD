# Maintainer: nosada <ngsksdt@gmail.com>

pkgname=python-mojimoji
_pkgname=mojimoji
pkgver=0.0.11
pkgrel=1
pkgdesc="A fast converter between Japanese hankaku and zenkaku characters"
url="https://github.com/studio-ousia/mojimoji"
arch=('x86_64' 'i686')
license=('Apache')
depends=('python')
makedepends=('python-setuptools' 'cython')
source=("https://github.com/studio-ousia/${_pkgname}/archive/${pkgver}.tar.gz")
sha512sums=('4601716e8b60812e62b0b222d287a67e64f260d18673eb17c6fc024ee52a5dd60696ae8f8fb75c4adb8902bd5affa364f9ae06de7e4bdb8b181621de67a9b352')

build() {
  cd ${srcdir}/${_pkgname}-${pkgver}/
  python setup.py build
}

package() {
  cd ${srcdir}/${_pkgname}-${pkgver}/
  python setup.py install --root=${pkgdir}
}

# vim:set ts=2 sw=2 et:
