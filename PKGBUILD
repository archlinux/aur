# Maintainer: Mohamar Rios <mohamar.rios@gmail.com>

_pkgname=sseclient
pkgname=python2-${_pkgname}
pkgver=0.0.11
pkgrel=1
pkgdesc="Python client library for reading Server Sent Event streams."
arch=('any')
url="https://pypi.python.org/pypi/sseclient"
license=('MIT')
depends=('python2')
makedepends=('python2-setuptools'
             'python2-pytest'
             'python2-pytest-runner'
             'python2-backports.unittest_mock'
             'python2-requests'
             'python2-six')
options=(!emptydirs)
source=("https://pypi.python.org/packages/source/${_pkgname:0:1}/${_pkgname}/${_pkgname}-${pkgver}.tar.gz")
md5sums=('a4c44ff8d526eaa1a3c9091215e8150c')

package() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  python2 setup.py install --root="${pkgdir}/" --optimize=1
}

# vim:set ts=2 sw=2 et:
