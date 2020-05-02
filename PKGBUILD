# Maintainer: nosada <ngsksdt@gmail.com>

pkgname=python-mojimoji
_pkgname=mojimoji
pkgver=0.0.10
pkgrel=1
pkgdesc="A fast converter between Japanese hankaku and zenkaku characters"
url="https://github.com/studio-ousia/mojimoji"
arch=('x86_64' 'i686')
license=('Apache')
depends=('python')
makedepends=('python-setuptools' 'cython')
source=("https://github.com/studio-ousia/${_pkgname}/archive/${pkgver}.tar.gz")
sha512sums=('5afcbe4dc801e4697b18b473280d142a7e25a537087b305f8f6b7116195e5a541019511db84bb92d9b87d53f816c8a0e7674ace4b608be53f7b020d35a53d300')

build() {
  cd ${srcdir}/${_pkgname}-${pkgver}/
  python setup.py build
}

package() {
  cd ${srcdir}/${_pkgname}-${pkgver}/
  python setup.py install --root=${pkgdir}
}

# vim:set ts=2 sw=2 et:
