# Maintainer: Kuan-Yen Chou <kuanyenchou@gmail.com>

pkgname=opendaylight
pkgver=0.9.3
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
sha256sums=('da69972d086f1a1954b2c56218c825333f1b5f1b7c43b66009564a2a780ba802')

package() {
    cd "${srcdir}"
    mkdir -p "${pkgdir}/opt"
    mv "${pkgname}-${pkgver}" "${pkgdir}/opt/${pkgname}"
}

# vim: set ts=4 sw=4 et:
