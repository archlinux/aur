# Contributor: Andrey Mikhaylenko <neithere at gmail dot com>
pkgname=python-gpxpy
pkgver=1.1.1
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
sha256sums=('7c0353a5f7363d205d767c3df249b19ca68ea5c9421d93c44574d192b9d6f47a')

package() {
   cd "${srcdir}/gpxpy-${pkgver}"
   python setup.py install --root="${pkgdir}" --optimize=1 || exit 1
}
