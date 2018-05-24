# Maintainer: Mohamar Rios <mohamar.rios@gmail.com>

pkgname=python2-sseclient
_name=${pkgname#python2-}
pkgver=0.0.19
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
source=("https://files.pythonhosted.org/packages/source/${_name::1}/${_name}/${_name}-${pkgver}.tar.gz")
sha256sums=('7a2ea3f4c8525ae9a677bc8193df5db88e23bcaafcc34938a1ee665975703a9f')

package() {
  cd "${srcdir}/${_name}-${pkgver}"
  python2 setup.py install --root="${pkgdir}/" --optimize=1
}

# vim:set ts=2 sw=2 et:
