# Maintainer: Michael Spradling <mike@mspradling.com>
pkgname=python-easyprocess
pkgver=0.1.6
pkgrel=1
pkgdesc="EasyProcess is an easy to use python subprocess interface."
arch=(any)
url="https://pypi.python.org/pypi/EasyProcess"
license=('BSD')
depends=('python>=3.2' 'python-setuptools')
source=(https://pypi.python.org/packages/source/E/EasyProcess/EasyProcess-${pkgver}.tar.gz)
md5sums=('8719886c7962bfea97a7d82fccd657a9')

build() {
cd "${srcdir}/EasyProcess-${pkgver}"
  python setup.py install --root="${pkgdir}" --optimize=1 || exit 1
}
