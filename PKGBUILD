# Maintainer: Max G <max3227@gmail.com>

pkgname=python-scapy-utils
_pypiname=${pkgname/python-/}
pkgver=0.3.9
pkgrel=1
pkgdesc="A collection of utility function for use with Scapy module"
arch=('any')
url='https://pypi.org/project/scapy-utils/'
license=('MIT')
depends=('python-setuptools' 'python-scapy')

source=("https://files.pythonhosted.org/packages/4e/e1/4736484c8cfd51369fb922ee9042eae5874630e089c887d77422c1baf949/scapy-utils-0.3.9.tar.gz")
sha256sums=('fe7bde00cbe32d871930c2cd1b29b26c3fcf88d9d1fac1b73a162ade8f1da93d')

package() {
    cd $srcdir/${_pypiname}-${pkgver}
    python setup.py install --root="${pkgdir}/" --optimize=1
}

