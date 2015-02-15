# Maintainer: Thomas Weißschuh <thomas t-8ch.de>

pkgname=pex
pkgver=0.8.1
pkgrel=1
pkgdesc='A library and tool for generating .pex (Python EXecutable) files'
arch=('any')
url='https://pex.readthedocs.org/'
license=('Apache2')
depends=('python2' 'python2-wheel')
source=("https://pypi.python.org/packages/source/p/pex/pex-${pkgver}.tar.gz")


build() {
    cd "${srcdir}/pex-${pkgver}"
    python2 setup.py build
}

package() {
    cd "${srcdir}/pex-${pkgver}"
    python2 setup.py install --root="${pkgdir}" --optimize=1
}

sha256sums=('55dbbfdc20e4eb4effadab12bba3edc78abee4cf47091ef5fc307200aac22f37')
