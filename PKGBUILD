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

source=("https://files.pythonhosted.org/packages/b3/ab/7a510ad0b9c866481aabc95b2b6c56853c1303d47c3322bb54f0ec649152/scapy-utils-0.3.7.tar.gz")
sha256sums=('759e39e64d8686ccbc5421b48ce61c6e3c08048d69209ffe3fcee4dc6b334daf')

package() {
    cd $srcdir/${_pypiname}-${pkgver}
    python setup.py install --root="${pkgdir}/" --optimize=1
}

