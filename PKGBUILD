# Maintainer: Max G <max3227@gmail.com>

pkgname=python-manuf
_pypiname=${pkgname/python-/}
pkgver=1.1.3
pkgrel=1
pkgdesc="Parser library for Wireshark's OUI database"
arch=('any')
url='https://pypi.org/project/manuf/'
license=('Apache GPL3')
depends=('python-setuptools')

source=("https://files.pythonhosted.org/packages/e9/02/abe5082ab1da56d240bff0f96efcb882b767801d2c17594f8736d733ee44/manuf-1.1.3.tar.gz")
sha256sums=('4f6cec3805886a815ac0984ce230fc93a7f2f68f3a990c178b5ad7254d08e65f')

package() {
    cd $srcdir/${_pypiname}-${pkgver}
    python setup.py install --root="${pkgdir}/" --optimize=1
}

