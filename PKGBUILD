# Maintainer: Kevin Houdebert <kevin@qwazerty.eu>

pkgname=python2-pywinrm
_realname=pywinrm
pkgver=0.1.1
pkgrel=1
pkgdesc="Python library for Windows Remote Management"
arch=(any)
url="https://pypi.python.org/pypi/pywinrm"
license=('MIT')
depends=('python2' 'python2-isodate' 'python2-xmltodict')
source=("https://pypi.python.org/packages/source/p/pywinrm/pywinrm-${pkgver}.tar.gz")
md5sums=('131ae8209c9d053e397770d67f5c9734')

package() {
    cd ${srcdir}/${_realname}-${pkgver}
    python2 setup.py install --root=${pkgdir}/ --optimize=1
}

# vim:set ts=4 sw=4 et:
