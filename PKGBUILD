pkgbase=('python2-acora')
pkgname=('python2-acora')
_module='acora'
pkgver='2.0'
pkgrel=1
pkgdesc="Fast multi-keyword search engine for text strings"
url="http://pypi.python.org/pypi/acora"
depends=('python2')
makedepends=('python2-setuptools')
license=('BSD')
arch=('any')
source=("https://pypi.python.org/packages/96/2b/e4dfd6be50b239d45f90f10db6f7fad8ffcb72bc52620a0b2038318152a3/acora-2.0.tar.gz#md5=ba43c40dcc00edf945c17b39da4eb79f")
md5sums=('ba43c40dcc00edf945c17b39da4eb79f')

build() {
    cd "${srcdir}/${_module}-${pkgver}"
    python2 setup.py build
}

package() {
    depends+=()
    cd "${srcdir}/${_module}-${pkgver}"
    python2 setup.py install --root="${pkgdir}" --optimize=1 --skip-build
}
