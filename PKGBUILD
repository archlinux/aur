# Maintainer: Michael Spradling <mike@mspradling.com>
pkgname=python-easyprocess
pkgver=0.2.3
pkgrel=1
pkgdesc="EasyProcess is an easy to use python subprocess interface."
arch=(any)
url="https://pypi.python.org/pypi/EasyProcess"
license=('BSD')
depends=('python>=3.2' 'python-setuptools')
source=(https://pypi.python.org/packages/0d/f1/d2de7591e7dfc164d286fa16f051e6c0cf3141825586c3b04ae7cda7ac0f/EasyProcess-${pkgver}.tar.gz)
md5sums=('d08c91cbb2cc4603297968e1ed9eac0f')

package() {
  cd "${srcdir}/EasyProcess-${pkgver}"
  python setup.py install --root="${pkgdir}" --optimize=1 || exit 1
}
