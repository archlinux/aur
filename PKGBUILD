# Maintainer: Thiago Coutinho <root@thiagoc.net>
# https://github.com/thiagoc/aur-packages

pkgname='python-vex'
pkgver=0.0.18
pkgrel=1
pkgdesc='Run commands in a virtualenv'
url='https://pypi.python.org/pypi/vex'
arch=('any')
license=('MIT')
depends=('python')
source=("https://pypi.python.org/packages/source/v/vex/vex-${pkgver}.tar.gz")
md5sums=('15f42bb9ca100c8f7a377e1a8f21c86a')

build() {
    cd ${srcdir}/vex-${pkgver}
    python setup.py build || return 1
}

package() {
    cd ${srcdir}/vex-${pkgver}
    python setup.py install --root=${pkgdir} || return 1 
}

# vim:set ts=2 sw=2 et:
