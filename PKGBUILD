# Maintainer: Nick Blais <nick.blais@thinkrf.com>
pkgbase=('python2-qt4reactor')
pkgname=('python2-qt4reactor')
_module='qt4reactor'
pkgver='1.6'
pkgrel=1
pkgdesc="Twisted Qt Integration"
url="https://github.com/ghtdak/qtreactor"
depends=('python2')
makedepends=('python2-setuptools')
license=('MIT')
arch=('any')
source=("https://files.pythonhosted.org/packages/source/q/qt4reactor/qt4reactor-${pkgver}.tar.gz")
md5sums=('0a1531e265a5b7a524852b712b89ba1d')

build() {
    cd "${srcdir}/${_module}-${pkgver}"
    python2 setup.py build
}

package() {
    depends+=()
    cd "${srcdir}/${_module}-${pkgver}"
    python2 setup.py install --root="${pkgdir}" --optimize=1 --skip-build
}
