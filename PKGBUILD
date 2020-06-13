# Maintainer: Max G <max3227@gmail.com>

pkgname=python-scapy-utils
_pypiname=${pkgname/python-/}
pkgver=0.3.8
pkgrel=1
pkgdesc="A collection of utility function for use with Scapy module"
arch=('any')
url='https://pypi.org/project/scapy-utils/'
license=('MIT')
depends=('python-setuptools' 'python-scapy')

source=("https://files.pythonhosted.org/packages/39/b3/f897bdf6eb19bc777ed3a32e51e9229193edc1b11f7277081372b0ec1fe7/scapy-utils-0.3.8.tar.gz")
sha256sums=('1e5739b83efb5737f01c6849b4d28cfdb51ac14f380bab4816a811afcc58b3c5')

package() {
    cd $srcdir/${_pypiname}-${pkgver}
    python setup.py install --root="${pkgdir}/" --optimize=1
}

