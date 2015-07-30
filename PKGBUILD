# Maintainer: Wang Jiajun <amesists AT gmail DOT com>
pkgname=python-you-get
_pkgname=you-get
_ver=0.3.33
_subver=
pkgver=${_ver}
_pkgver=${_ver}
pkgrel=1
pkgdesc="A YouTube/Youku/Niconico video downloader written in Python 3."
url="http://www.soimort.org/you-get/"
arch=('any')
license=('MIT')
depends=('python' 'python-distribute')
makedepends=('python')
source=("https://pypi.python.org/packages/source/y/${_pkgname}/${_pkgname}-${_pkgver}.tar.gz")
sha256sums=('580632b57d336cece399ff194669ad6cb13e6e1cb068de5005d37d2d7be8e020')

build() {
  cd "${srcdir}"/${_pkgname}-${_pkgver}
  python setup.py build
}

package() {
  cd "${srcdir}"/${_pkgname}-${_pkgver}
  python setup.py install --root=$pkgdir
}
