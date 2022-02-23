# Maintainer: nosada <ngsksdt@gmail.com>

pkgname=python-janome
_pkgname=janome
pkgver=0.4.2
pkgrel=1
pkgdesc="Japanese morphological analysis engine written in pure Python"
url="http://mocobeta.github.io/janome/en/"
arch=('x86_64' 'i686')
license=('Apache')
depends=('python')
makedepends=('python-setuptools')
source=("https://github.com/mocobeta/${_pkgname}/archive/${pkgver}.tar.gz")
sha512sums=('71b368b8d591e9133e8faf401588f1413e7deb060df1061faf4e95ac92b9129f9730cc1a391d870f027b0090a1324df4276235ae55faab1f0d3114b4e383dbe2')

build() {
  cd ${srcdir}/${_pkgname}-${pkgver}/
  python setup.py build
}

package() {
  cd ${srcdir}/${_pkgname}-${pkgver}/
  python setup.py install --root=${pkgdir}
}

# vim:set ts=2 sw=2 et:
