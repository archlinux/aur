# Maintainer: Lorenzo Cappelletti <lorenzo.cappelletti gmail.com>

_pyname=mbed-os-tools
pkgname=python-${_pyname}
pkgver=0.0.13
pkgrel=1
pkgdesc="The tools to test and work with Mbed OS"
arch=('any')
url="https://developer.mbed.org"
license=('Apache')
depends=(
        'python'
        'python-pyserial'
        'python-requests'
        'python-intelhex'
        'python-prettytable'
        'python-fasteners'
        'python-appdirs'
        'python-junit-xml'
        'python-lockfile'
        'python-six'
        'python-colorama'
        'python-beautifulsoup4'
)
makedepends=('python-setuptools')
options=(!emptydirs)
source=("https://github.com/ARMmbed/mbed-os-tools/archive/$pkgver.tar.gz")
sha256sums=('a50772dfe1a3862897cb668452b846844a29a8c59503ddb3e95bcd59dab41e09')

package() {
  cd "$srcdir/${_pyname}-${pkgver}"
  python setup.py install --root="$pkgdir/" --optimize=1
}

# vim:set ts=2 sw=2 et:
