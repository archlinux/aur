# Maintainer: nosada <ngsksdt@gmail.com>

pkgname=python-janome
_pkgname=janome
pkgver=0.3.9
pkgrel=1
pkgdesc="Japanese morphological analysis engine written in pure Python"
url="http://mocobeta.github.io/janome/en/"
arch=('x86_64' 'i686')
license=('Apache')
depends=('python')
makedepends=('python-setuptools')
source=("https://github.com/mocobeta/${_pkgname}/archive/${pkgver}.tar.gz")
sha512sums=('ee21ac702aa4e5e390f7a1f90ad38c4245e79cb0b810015207eb41ad9b54b238467899ea5b9a554bbcf8da3ca7c247d848ad7b9f7ba70cdf4f2d54ac5a028a21')

build() {
  cd ${srcdir}/${_pkgname}-${pkgver}/
  python setup.py build
}

package() {
  cd ${srcdir}/${_pkgname}-${pkgver}/
  python setup.py install --root=${pkgdir}
}

# vim:set ts=2 sw=2 et:
