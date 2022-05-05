# Maintainer: Max G <max3227@gmail.com>

pkgname=python-manuf
_pypiname=${pkgname/python-/}
pkgver=1.1.5
pkgrel=1
pkgdesc="Parser library for Wireshark's OUI database"
arch=('any')
url='https://pypi.org/project/manuf/'
license=('Apache GPL3')
depends=('python-setuptools')

source=("https://files.pythonhosted.org/packages/0a/a3/9db33765f9d962de4b113c2f07b6d5bab4521ed4feec4cb97cbf18184602/manuf-1.1.5.tar.gz")
sha256sums=('741989728c8ffd0d5c5782376c00270fcd48cf7544f58bf9492a0ef674d433cd')

package() {
    cd $srcdir/${_pypiname}-${pkgver}
    python setup.py install --root="${pkgdir}/" --optimize=1
}

