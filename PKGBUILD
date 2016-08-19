# Maintainer: MartiMcFly <martimcfly [at] autorisation.de>

pkgbase=('python2-minimock')
pkgname=('python2-minimock')
_module='MiniMock'
pkgver='1.2.8'
pkgrel=1
pkgdesc="The simplest possible mock library"
url="http://pypi.python.org/pypi/MiniMock"
depends=('python2')
makedepends=('python2-setuptools')
license=('MIT')
arch=('any')
source=("https://pypi.python.org/packages/43/c8/0928c5f684d6f86fb34c12e4b6bcde2dd8b951d060f304b5e4cc4d13d106/MiniMock-1.2.8.tar.gz")
md5sums=('76593aaba949b5e010fec95283556449')

build() {
    cd "${srcdir}/${_module}-${pkgver}"
    python2 setup.py build
}

package() {
    depends+=()
    cd "${srcdir}/${_module}-${pkgver}"
    python2 setup.py install --root="${pkgdir}" --optimize=1 --skip-build
}
