# Maintainer: Guillaume Brogi <gui-gui@netcourrier.com>
# Based on python2-pywinrm package by: Kevin Houdebert <kevin@qwazerty.eu>

pkgbase=python-pywinrm
pkgname=python-pywinrm-old
_realname=pywinrm
pkgver=0.2.0
pkgrel=3
pkgdesc="Python library for Windows Remote Management"
arch=(any)
url="https://pypi.python.org/pypi/pywinrm"
license=('MIT')
depends=('python' 'python-requests' 'python-xmltodict')
optdepends=('python-requests-ntlm: for HTTP NTLM authentication'
            'python-requests-kerberos: for kerberos authentication')
source=("https://github.com/diyan/pywinrm/archive/v${pkgver}.zip")
md5sums=('58c439f96aeb79ee4b5b23b8a0f22e79')

package() {
    cd ${srcdir}/${_realname}-${pkgver}
    python setup.py install --root=${pkgdir}/ --optimize=1
}

# vim:set ts=4 sw=4 et:
