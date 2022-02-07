# Maintainer: Barfin

pkgname=openlara-bin
pkgver=8.01.21
pkgrel=1
pkgdesc="Classic Tomb Raider open-source engine"
arch=('i686' 'x86_64')
url="https://github.com/XProger/OpenLara"
license=("BSD-2-Clause")
source=("${url}/releases/download/latest/OpenLara_nix.zip")
options=('!strip')
conflicts=('openlara-git')
provides=('openlara')
depends=('libx11' 'libgl' 'libpulse')
install=${pkgname}.install

package() {
    install -Dm755 "${srcdir}/OpenLara" "${pkgdir}/usr/bin/openlara"
}

md5sums=('ef467d23c4fd6c566e1265df75afdd02')
