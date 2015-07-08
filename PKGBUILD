# Maintainer: neithere <neithere at gmail>
# Contributor: nblock <nblock [/at\] archlinux DOT us>
# Contributor: mitsuse <mitsuse at gmail>

pkgname=python-wtforms
pkgver=2.0.1
pkgrel=1
pkgdesc='A flexible forms validation and rendering library for python web development.'
arch=('any')
url="http://pypi.python.org/pypi/WTForms"
license=('BSD')
depends=('python')
makedepends=('unzip' 'python-distribute')
source=("http://pypi.python.org/packages/source/W/WTForms/WTForms-${pkgver}.zip")
md5sums=('aaac94c137b3cd63efeb3ded51082cde')

package() {
    cd ${srcdir}/WTForms-${pkgver}
    python setup.py install --root=${pkgdir}/ --optimize=1
}
