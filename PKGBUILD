# Maintainer: nosada <ngsksdt@gmail.com>

pkgname=python-janome
_pkgname=janome
pkgver=0.2.8
pkgrel=1
pkgdesc="Japanese morphological analysis engine written in pure Python"
url="http://mocobeta.github.io/janome/en/"
arch=('x86_64' 'i686')
license=('Apache')
depends=('python')
source=("https://github.com/mocobeta/${_pkgname}/archive/${pkgver}.tar.gz")
sha1sums=('fc5f267ab5652d6ddac5ac17c7cacb4ad76df3f2')

build() {
  cd ${srcdir}/${_pkgname}-${pkgver}/
  python setup.py build
}

package() {
  cd ${srcdir}/${_pkgname}-${pkgver}/
  python setup.py install --root=${pkgdir}
}

# vim:set ts=2 sw=2 et:
