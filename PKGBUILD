# Maintainer: GI_Jack <GI_Jack@hackermail.com>
pkgname=('python-clearbit' 'python2-clearbit')
pkgbase=python-clearbit
_pypiname=clearbit
pkgver=0.1.7
pkgrel=1
pkgdesc="A Python API client to https://clearbit.com"
arch=('any')
url="https://pypi.org/project/clearbit/"
license=('MIT')
depends=('python' 'python-simplejson')
makedepends=('python-setuptools')
backup=()
install=
source=("https://files.pythonhosted.org/packages/50/e7/bbd7c4525cb4ecb74fbe7f4dff6f4112342d9050d64b3be8d56b8c0a028b/clearbit-${pkgver}.tar.gz")
sha256sums=('f1d5b854a9b0e8d6644bad2594f9e65ab756ffb0c6c34db15ecfc1e9179bb883')

package_python-clearbit() {
  depends=('python' 'python-simplejson')
  makedepends=('python-setuptools')
  cd "${_pypiname}-${pkgver}"
  python setup.py install -O1 --root="${pkgdir}" --prefix=/usr
}

package_python2-clearbit() {
  depends=('python2' 'python2-simplejson')
  makedepends=('python2-setuptools')
  cd "${_pypiname}-${pkgver}"
  python2 setup.py install -O1 --root="${pkgdir}" --prefix=/usr
}
