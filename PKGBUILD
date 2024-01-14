# Maintainer: nosada <ngsksdt@gmail.com>

pkgname=python-mojimoji
_pkgname=mojimoji
pkgver=0.0.13
pkgrel=1
pkgdesc="A fast converter between Japanese hankaku and zenkaku characters"
url="https://github.com/studio-ousia/mojimoji"
arch=('x86_64' 'i686')
license=('Apache')
depends=('python')
makedepends=('python-setuptools' 'cython')
source=("https://github.com/studio-ousia/${_pkgname}/archive/refs/tags/v${pkgver}.tar.gz")
sha512sums=('e7c4981756ea402a0acdd2da430274f0179af0036cf0e4a2f5a0b34601627ee040576589948d283b095c0cb6fbeca1bdb8bd17e15397aa694eeaf77e76d28a55')

build() {
  cd ${srcdir}/${_pkgname}-${pkgver}/
  python setup.py build
}

package() {
  cd ${srcdir}/${_pkgname}-${pkgver}/
  python setup.py install --root=${pkgdir}
}

# vim:set ts=2 sw=2 et:
