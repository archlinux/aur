# Maintainer: Kuan-Yen Chou <kuanyenchou@gmail.com>

pkgname=opendaylight
pkgver=0.9.0
pkgrel=1
pkgdesc='A modular open platform for customizing and automating networks of any size and scale.'
arch=('x86_64')
url='https://www.opendaylight.org/'
license=('EPL')
depends=('jdk8-openjdk' 'maven')
makedepends=()
provides=()
conflicts=()
options=()
install=opendaylight.install
source=(https://nexus.opendaylight.org/content/repositories/public/org/opendaylight/integration/${pkgname}/${pkgver}/${pkgname}-${pkgver}.tar.gz)
sha256sums=('103888d5e3d65995bd097f3890010ea28b054080cc06767e6a997fa65b85cb32')

package() {
    cd "${srcdir}"
    mkdir -p "${pkgdir}/opt"
    mv "${pkgname}-${pkgver}" "${pkgdir}/opt/${pkgname}"
}

# vim: set ts=4 sw=4 et:
