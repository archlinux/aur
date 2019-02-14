# Maintainer: GI_Jack <GI_Jack@hackermail.com>

pkgbase=python-piplapis
pkgname=('python-piplapis' 'python2-piplapis')
_pypiname=piplapis
pkgver=5.1.5
pkgrel=1
pkgdesc="Python Library for interfacing with pipl.com"
url="https://pypi.org/project/piplapis-python/"
arch=('any')
license=('Apache2')
depends=('python-pytz')
makedepends=('python-six' 'python-setuptools')
source=(${_pypiname}-${pkgver}.tar.gz::"https://files.pythonhosted.org/packages/5a/88/aec9ad32c803653cbe06d436c8d542ba631414d1a094de603d48dfbd982a/piplapis-python-${pkgver}.tar.gz")
sha256sums=('9a0abf374099c121da049af6d10f8d93f4f4b5cb6d02dc5f0d186ea3a58d99b0')

package_python-piplapis() {
  depends=('python-pytz')
  makedepends=('python-six' 'python-setuptools')
  cd piplapis-python-${pkgver}
  python setup.py install -O1 --root="${pkgdir}" --prefix=/usr
}

package_python2-piplapis() {
  depends=('python2-pytz')
  makedepends=('python-six' 'python2-setuptools')
  cd piplapis-python-${pkgver}
  python2 setup.py install -O1 --root="${pkgdir}" --prefix=/usr
}


