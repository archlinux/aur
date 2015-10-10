# Maintainer: Andrey Mikhaylenko <neithere at gmail dot com>
pkgname=python-gpxpy
pkgver=0.8.8
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
source=(http://pypi.python.org/packages/source/g/gpxpy/gpxpy-${pkgver}.tar.gz)
md5sums=('2bb43fef121bc700a38ad086235067b6')

package() {
   cd "${srcdir}/gpxpy-${pkgver}"
   python setup.py install --root="${pkgdir}" --optimize=1 || exit 1
}
