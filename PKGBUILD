# Maintainer: Wainer Vandelli (<firstname>DOT<lastname>ATgmail.com)
pkgname=cernbox-overlay-icons
pkgver=2.9.2_6339
pkgrel=1
pkgdesc="Desktop integration icons for CERN's CERNBox cloud service (based on ownCloud). Note: CERN IT does not provide official support for Arch Linux. Use at your own risk."
arch=('x86_64')
url="http://cernbox.web.cern.ch/"
license=('GPL')

_repo='https://cernbox.cern.ch/cernbox/doc/Linux/repo/Fedora_32/'
source=(
    ${_repo}cernbox-client-overlays-icons-${pkgver/_/-}.x86_64.rpm
)
md5sums=('bbd8d15c0a35bb66b32b4f3d6c36d208')

package() {
    mkdir -p "${pkgdir}/usr"
    cp -dpr "${srcdir}/usr/share" "${pkgdir}/usr/"
}
