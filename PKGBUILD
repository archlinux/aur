# Maintainer: Mohamar Rios <mohamar.rios@gmail.com>

_pkgname=backports.unittest_mock
pkgname=python2-${_pkgname}
pkgver=1.1.1
pkgrel=1
pkgdesc="The mock module on Python 3.2 and earlier."
arch=('any')
url="https://pypi.python.org/pypi/backports.unittest_mock"
license=('MIT')
depends=('python2'
         'python2-backports'
         'python2-mock')
makedepends=('python2-setuptools'
             'python2-setuptools-scm'
             'python2-pytest'
             'python2-pytest-runner'
             'python2-wheel'
             'python2-sphinx')
options=(!emptydirs)
source=("https://pypi.python.org/packages/source/${_pkgname:0:1}/${_pkgname}/${_pkgname}-${pkgver}.tar.gz")
md5sums=('6ee907f7d8e35df16a06268e65d28e5f')

package() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  python2 setup.py install --root="${pkgdir}/" --optimize=1
}

# vim:set ts=2 sw=2 et:
