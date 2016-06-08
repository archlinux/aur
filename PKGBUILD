# Maintainer: Kevin Houdebert <kevin@qwazerty.eu>

pkgname=python2-pywinrm
_realname=pywinrm
pkgver=0.2.0
pkgrel=1
pkgdesc="Python library for Windows Remote Management"
arch=(any)
url="https://pypi.python.org/pypi/pywinrm"
license=('MIT')
depends=('python2' 'python2-isodate' 'python2-xmltodict')
source=("https://github.com/diyan/pywinrm/archive/v${pkgver}.tar.gz")
sha256sums=('e8a9afd6f68a152bf9b6ccc07574d35cb4bebe24af779d701c325f0e96226ccc')

package() {
    cd ${srcdir}/${_realname}-${pkgver}
    python2 setup.py install --root=${pkgdir}/ --optimize=1
}

# vim:set ts=4 sw=4 et:
