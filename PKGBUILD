# Maintainer: Erhan SAHIN < erhan@ssahin.net >

pkgname=("python2-cliff-tablib-liberty")
pkgver="1.1"
pkgrel="3"
pkgdesc="tablib formatters for cliff"
arch=("any")
url="https://github.com/dreamhost/cliff-tablib"
license=("Apache")
makedepends=("python2-setuptools")
source=("https://pypi.python.org/packages/source/c/cliff-tablib/cliff-tablib-${pkgver}.tar.gz")
sha256sums=('4a8ed81f6678e76d0e0497f2708d0fe5d2b83ec442a03f982aaa711a08c74139')

package_python2-cliff-tablib-liberty() {
    depends=("python2-cliff-liberty" "python2-tablib")
    cd "${srcdir}/cliff-tablib-${pkgver}"
    python2 setup.py install --root="${pkgdir}" --optimize=1
}
