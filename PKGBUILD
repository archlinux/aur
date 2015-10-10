# Contributor: Andrey Mikhaylenko <neithere at gmail dot com>
pkgname=python-gpxpy
pkgver=1.0.0
pkgrel=1
pkgdesc="Python GPX (GPS eXchange format) parser"
arch=(any)
url="https://github.com/tkrajina/gpxpy"
license=('Apache')
depends=('python>=3.2' 'python-lxml>=3.1.2')
makedepends=('python-distribute')
provides=()
conflicts=()
replaces=()
backup=()
options=(!emptydirs)
install=
source=(https://pypi.python.org/packages/source/g/gpxpy/gpxpy-${pkgver}.tar.gz)
sha256sums=('97fedc72973dc21663868143ae92129d7f2f1505b14a8239ea927684bbdf7001')

package() {
   cd "${srcdir}/gpxpy-${pkgver}"
   python setup.py install --root="${pkgdir}" --optimize=1 || exit 1
}
