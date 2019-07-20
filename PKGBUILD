# Maintainer: GI_Jack <GI_Jack@hackermail.com>

pkgname=python-passwordmeter
_pypiname=passwordmeter
pkgver=0.1.8
pkgrel=1
pkgdesc="A Password strength measuring library, for Python"
url="https://pypi.org/project/passwordmeter/"
arch=('any')
license=('MIT')
depends=('python' 'python-asset')
makedepends=('python-setuptools')
source=(${_pypiname}-${pkgver}.tar.gz::"https://files.pythonhosted.org/packages/87/d2/f26c809d2592b94be0767a8403f5ed4a3d238fbd4c8f14b60306d33d5f8f/passwordmeter-${pkgver}.tar.gz")
sha256sums=('f4f7df54182072a137bca3e396f2dad354770ba596dd41f6646cd1f0665fee12')

package() {
  cd ${_pypiname}-${pkgver}
  python setup.py install -O1 --root="${pkgdir}" --prefix=/usr
}
