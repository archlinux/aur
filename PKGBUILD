# Maintainer: GI_Jack <GI_Jack@hackermail.com>

pkgbase=python-travispy
pkgname=('python-travispy' 'python2-travispy')
_pypiname=travispy
pkgver=0.3.5
pkgrel=1
pkgdesc="TravisPy is a Python API for Travis CI. It follows the official API and is implemented as similar as possible to Ruby implementation."
url="https://github.com/menegazzo/travispy"
arch=('any')
license=('GPLv3')
depends=('python-coverage' 'python-pytest' 'python-pytest-rerunfailures' 'python-requests')
makedepends=('python-setuptools')
source=(${_pypiname}-${pkgver}.tar.gz::"https://github.com/menegazzo/travispy/archive/v${pkgver}.tar.gz")
sha256sums=('85293ac89d2cea0244c2a9cb64e447096993ac53fa41cc3ab8ae18d6a4d575b0')

package_python-travispy() {
  depends=('python-coverage' 'python-pytest' 'python-pytest-rerunfailures' 'python-requests')
  makedepends=('python-setuptools')
  cd ${_pypiname}-${pkgver}
  python setup.py install -O1 --root="${pkgdir}" --prefix=/usr
}

package_python2-travispy() {
  depends=('python2-coverage' 'python2-pytest' 'python2-pytest-rerunfailures' 'python2-requests')
  makedepends=('python2-setuptools')
  cd ${_pypiname}-${pkgver}
  python2 setup.py install -O1 --root="${pkgdir}" --prefix=/usr
}


