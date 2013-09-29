# Maintainer: Leonidas Spyropoulos <artafinde at gmail dot com>

pkgname=caatinga
pkgver=1.0.2
pkgrel=1
pkgdesc="A command line backup program written in Python"
arch=('any')
url="https://github.com/headmastersquall/caatinga"
license=('GPL3')
depends=('python2-distribute')
conflicts=('caatinga-git')
provides=('caatinga')
source=(https://github.com/headmastersquall/caatinga/archive/caatinga-1.0.2.tar.gz)
md5sums=('0917d8d20b3f534d3823557ad5b52808')

package() {
    cd ${srcdir}/${pkgname}-${pkgname}-${pkgver}
    python2 setup.py install --root="${pkgdir}/" --optimize=1
}

# vim:set ts=2 sw=2 et:
