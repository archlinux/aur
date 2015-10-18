# Maintainer: Wang Jiajun <amesists AT gmail DOT com>
pkgname=python-you-get
_pkgname=you-get
_ver=0.3.36
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
sha256sums=('39052ee16b3ca56be7c4ed743b64a85c9d8c8abe74daede56083670f334170dc')

build() {
  cd "${srcdir}"/${_pkgname}-${_pkgver}
  python setup.py build
}

package() {
  cd "${srcdir}"/${_pkgname}-${_pkgver}
  python setup.py install --root=$pkgdir
}
