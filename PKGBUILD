# Maintainer: nosada <ngsksdt@gmail.com>

pkgname=python-janome
_pkgname=janome
pkgver=0.3.7
pkgrel=1
pkgdesc="Japanese morphological analysis engine written in pure Python"
url="http://mocobeta.github.io/janome/en/"
arch=('x86_64' 'i686')
license=('Apache')
depends=('python')
source=("https://github.com/mocobeta/${_pkgname}/archive/${pkgver}.tar.gz")
sha512sums=('393450f48a9e694853d352ae6f05583609ecb66a6a88f145fad758d261aa7060b789e668368bd673e7d5ed826318e12f31b682e518001c5534a7b29664b0febe')

build() {
  cd ${srcdir}/${_pkgname}-${pkgver}/
  python setup.py build
}

package() {
  cd ${srcdir}/${_pkgname}-${pkgver}/
  python setup.py install --root=${pkgdir}
}

# vim:set ts=2 sw=2 et:
