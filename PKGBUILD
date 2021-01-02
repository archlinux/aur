# Maintainer: Rizwan Hasan <rizwan.hasan486@gmail.com>
# TechLearners: https://github.com/TechLearnersInc

pkgname=rubaialter
pkgver=1.1.0b1
pkgrel=1
pkgdesc="A module for altering numerical dataset's formats, made on top of Pandas."
arch=('any')
url="https://pypi.org/project/rubaialter/"
license=('MIT')
depends=('python-pandas' 'python-xlwt' 'python-xlrd' 'python-openpyxl')
makedepends=('python-setuptools')
source=("https://pypi.org/packages/source/${pkgname:0:1}/$pkgname/$pkgname-$pkgver.tar.gz")
sha256sums=('af33b8e414302b97d6d913701b16399a8ca794900a22bf92d37c9dc1939ecf7e')

package() {
    cd "${pkgname}-${pkgver}"
    python3 setup.py install --root="${pkgdir}" --optimize=1
}
