# Maintainer: nosada <ngsksdt@gmail.com>

pkgname=python-mojimoji
_pkgname=mojimoji
pkgver=0.0.9
pkgrel=1
pkgdesc="A fast converter between Japanese hankaku and zenkaku characters"
url="https://github.com/studio-ousia/mojimoji"
arch=('x86_64' 'i686')
license=('Apache')
depends=('python')
source=("https://github.com/studio-ousia/${_pkgname}/archive/v${pkgver}.tar.gz")
sha512sums=('340e4d7ae35ecef95bdbcbce4ba5b5a49df2af2d1570667e30cf176482c9ff31e028fd911854c3d0362cfe26aeb43276d4129d084a7f06e6d821eb157c3252cc')

build() {
  cd ${srcdir}/${_pkgname}-${pkgver}/
  python setup.py build
}

package() {
  cd ${srcdir}/${_pkgname}-${pkgver}/
  python setup.py install --root=${pkgdir}
}

# vim:set ts=2 sw=2 et:
