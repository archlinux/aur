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
md5sums=('eaf63bcad473dfd38b0a2fecfc89fb1c')

package() {
    cd "${srcdir}"/"${pkgname}"-"${pkgname}"-"${pkgver}"
    python2 setup.py install --root="${pkgdir}/" --optimize=1
}

# vim:set ts=2 sw=2 et:
