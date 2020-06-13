# Maintainer: Max G <max3227@gmail.com>

pkgname=python-manuf
_pypiname=${pkgname/python-/}
pkgver=1.1.1
pkgrel=4
pkgdesc="Parser library for Wireshark's OUI database"
arch=('any')
url='https://pypi.org/project/manuf/'
license=('Apache GPL3')
depends=('python-setuptools')

source=("https://files.pythonhosted.org/packages/9e/cf/354dddc57508194082c74310dec15341c008d47b7d37fd813d7fb0c46349/manuf-1.1.1.tar.gz")
sha256sums=('15faee73b91805ef1547e375628452dc3d5f2b9cf8ec005185a85c1345a828a4')

package() {
    cd $srcdir/${_pypiname}-${pkgver}
    python setup.py install --root="${pkgdir}/" --optimize=1
}

