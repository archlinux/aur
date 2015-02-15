# Maintainer: Thomas Weißschuh <thomas t-8ch.de>

pkgname=pex
pkgver=0.8.6
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

sha256sums=('956b1ae60c00c0a60f5ccd3dd06f9db732ec3f34831dce80be64cfaccb78ed9c')
