# Maintainer: Max G <max3227@gmail.com>

pkgname=python-scapy-utils
_pypiname=${pkgname/python-/}
pkgver=0.3.5
pkgrel=1
pkgdesc="A collection of utility function for use with Scapy module"
arch=('any')
url='https://pypi.org/project/scapy-utils/'
license=('MIT')
depends=('python-setuptools' 'python-scapy')

source=("https://files.pythonhosted.org/packages/8e/85/ba6899d77608355cd5cf6893ebf00a197924014d45e266e3f76341d4d457/scapy_utils-0.3.5.tar.gz")
sha256sums=('361eeb7c0d59b66c5719f795c5045c46ad5e0ac0459675b1286ea8a43a74cc83')

package() {
    cd $srcdir/${_pypiname}-${pkgver}
    python setup.py install --root="${pkgdir}/" --optimize=1
}

