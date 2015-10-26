# Maintainer: Michael Spradling <mike@mspradling.com>
pkgname=python-easyprocess
pkgver=0.1.9
pkgrel=1
pkgdesc="EasyProcess is an easy to use python subprocess interface."
arch=(any)
url="https://pypi.python.org/pypi/EasyProcess"
license=('BSD')
depends=('python>=3.2' 'python-setuptools')
source=(https://pypi.python.org/packages/source/E/EasyProcess/EasyProcess-${pkgver}.tar.gz)
md5sums=('3da72e2fe16781fe5c7b3b0c6c40ee7b')

package() {
  cd "${srcdir}/EasyProcess-${pkgver}"
  python setup.py install --root="${pkgdir}" --optimize=1 || exit 1
}
