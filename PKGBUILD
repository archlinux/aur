# Maintainer: nosada <ngsksdt@gmail.com>

pkgname=python-mojimoji
_pkgname=mojimoji
pkgver=0.0.12
pkgrel=1
pkgdesc="A fast converter between Japanese hankaku and zenkaku characters"
url="https://github.com/studio-ousia/mojimoji"
arch=('x86_64' 'i686')
license=('Apache')
depends=('python')
makedepends=('python-setuptools' 'cython')
source=("https://github.com/studio-ousia/${_pkgname}/archive/${pkgver}.tar.gz")
sha512sums=('d0547589ec1858f63e05c037e296a497b4b0f9db6cea1a7fec426d8a2b109473b4a97622cc8d4262ca9a7e31f89211ca7bae660b2d121d28f070ddf1627b0f1c')

build() {
  cd ${srcdir}/${_pkgname}-${pkgver}/
  python setup.py build
}

package() {
  cd ${srcdir}/${_pkgname}-${pkgver}/
  python setup.py install --root=${pkgdir}
}

# vim:set ts=2 sw=2 et:
