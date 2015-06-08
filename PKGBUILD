# Maintainer: nblock <nblock [/at\] archlinux DOT us>
# Contributor: mitsuse <mitsuse at gmail>

pkgname=python2-wtforms
pkgver=2.0.2
pkgrel=1
pkgdesc='A flexible forms validation and rendering library for python web development.'
arch=('any')
url="http://pypi.python.org/pypi/WTForms"
license=('BSD')
depends=('python2')
makedepends=('unzip' 'python2-distribute')
source=("http://pypi.python.org/packages/source/W/WTForms/WTForms-${pkgver}.zip")
md5sums=('613cf723ab40537705bec02733c78d95')

package() {
    cd ${srcdir}/WTForms-${pkgver}
    python2 setup.py install --root=${pkgdir}/ --optimize=1
}

# vim:set ts=2 sw=2 et:
