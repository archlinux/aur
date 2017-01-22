# Contributor: Andrey Mikhaylenko <neithere at gmail dot com>
pkgname=python-gpxpy
pkgver=1.1.2
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
source=(https://pypi.python.org/packages/51/3c/29004507bc4d5c1248a1a37ec01c2030b2e977609c219244d81f3041b745/gpxpy-1.1.2.tar.gz)
sha256sums=('c46b8fe738c6402638d2b5434020bc6ccd24b15090d7234fe9b158fdea14f354')

package() {
   cd "${srcdir}/gpxpy-${pkgver}"
   python setup.py install --root="${pkgdir}" --optimize=1 || exit 1
}
