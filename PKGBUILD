# Maintainer: Leonidas Spyropoulos <artafinde at gmail dot com>

pkgname=caatinga
pkgver=1.1.1
pkgrel=2
pkgdesc="A command line backup program written in Python"
arch=('any')
url="https://github.com/headmastersquall/caatinga"
license=('GPL3')
depends=('python2-setuptools')
conflicts=('caatinga-git')
provides=('caatinga')
source=(https://github.com/headmastersquall/caatinga/archive/caatinga-${pkgver}.tar.gz)
sha256sums=('91a5c26cdbc24b115d005dfdc7e31bf047fc68faa09dc348a508e8d88b85bef7')

package() {
    cd "${srcdir}"/"${pkgname}"-"${pkgname}"-"${pkgver}"
    python2 setup.py install --root="${pkgdir}/" --optimize=1
}

# vim:set ts=2 sw=2 et:
