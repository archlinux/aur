# Maintainer: Wainer Vandelli (<firstname>DOT<lastname>ATgmail.com)
pkgname=cernbox-overlay-icons
pkgver=2.3.3_1119.1
pkgrel=1
pkgdesc="Desktop integration icons for CERN's CERNBox cloud service (based on ownCloud). Note: CERN IT does not provide official support for Arch Linux. Use at your own risk."
arch=('x86_64')
url="http://cernbox.web.cern.ch/"
license=('GPL')

_repo='http://cernbox.cern.ch/cernbox/doc/Linux/repo/openSUSE_Leap_42.3/x86_64/'
source=(
    ${_repo}cernbox-client-overlays-icons-${pkgver/_/-}.x86_64.rpm
)
md5sums=('a33ccf51d9a9c434196426440232cf19')

package() {
    mkdir -p "${pkgdir}/usr"
    cp -dpr "${srcdir}/usr/share" "${pkgdir}/usr/"
}
