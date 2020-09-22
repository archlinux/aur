# Maintainer: nosada <ngsksdt@gmail.com>

pkgname=python-janome
_pkgname=janome
pkgver=0.4.1
pkgrel=1
pkgdesc="Japanese morphological analysis engine written in pure Python"
url="http://mocobeta.github.io/janome/en/"
arch=('x86_64' 'i686')
license=('Apache')
depends=('python')
makedepends=('python-setuptools')
source=("https://github.com/mocobeta/${_pkgname}/archive/${pkgver}.tar.gz")
sha512sums=('fecb9cfe2c1a0fbc55de0d1bb17472e74c1c6e1a704aa53e3eb0295d22bdd0f17c22e255201c141bc0fd79bad16a51cfc40445093db0934cff75ecbecc7f8f8c')

build() {
  cd ${srcdir}/${_pkgname}-${pkgver}/
  python setup.py build
}

package() {
  cd ${srcdir}/${_pkgname}-${pkgver}/
  python setup.py install --root=${pkgdir}
}

# vim:set ts=2 sw=2 et:
