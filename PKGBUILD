# Maintainer: Wang Jiajun <amesists AT gmail DOT com>
pkgname=python-you-get
_pkgname=you-get
_ver=0.3.35
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
sha256sums=('ae8613daa6f52a9c22f5352e1536f3a637058a37f904bb2b999877dfdc9ccaf8')

build() {
  cd "${srcdir}"/${_pkgname}-${_pkgver}
  python setup.py build
}

package() {
  cd "${srcdir}"/${_pkgname}-${_pkgver}
  python setup.py install --root=$pkgdir
}
