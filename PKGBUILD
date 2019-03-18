# Maintainer: Kuan-Yen Chou <kuanyenchou@gmail.com>

pkgname=opendaylight
pkgver=0.9.2
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
sha256sums=('d6f690cda6da1a240a1dbe64fd7f158b5f1d72084f3ccb7504ad55a3e569a43d')

package() {
    cd "${srcdir}"
    mkdir -p "${pkgdir}/opt"
    mv "${pkgname}-${pkgver}" "${pkgdir}/opt/${pkgname}"
}

# vim: set ts=4 sw=4 et:
