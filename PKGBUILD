# Maintainer: nosada <ngsksdt@gmail.com>

pkgname=python-janome
_pkgname=janome
pkgver=0.4.0
pkgrel=1
pkgdesc="Japanese morphological analysis engine written in pure Python"
url="http://mocobeta.github.io/janome/en/"
arch=('x86_64' 'i686')
license=('Apache')
depends=('python')
makedepends=('python-setuptools')
source=("https://github.com/mocobeta/${_pkgname}/archive/${pkgver}.tar.gz")
sha512sums=('35ff90beae706ee20938393ebbe96dfa8829cc44ac4917944db72ea1c91abbdfbd944cf0147780b3ef79bb2ec210c0db65bf879dc190518f1b7ea5c01aeca516')

build() {
  cd ${srcdir}/${_pkgname}-${pkgver}/
  python setup.py build
}

package() {
  cd ${srcdir}/${_pkgname}-${pkgver}/
  python setup.py install --root=${pkgdir}
}

# vim:set ts=2 sw=2 et:
