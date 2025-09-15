# Maintainer: Wainer Vandelli (<firstname>DOT<lastname>ATgmail.com)
pkgname=cernbox-overlay-icons
pkgver=5.3.2_15486
pkgrel=1
pkgdesc="Desktop integration icons for CERN's CERNBox cloud service (based on ownCloud). Note: CERN IT does not provide official support for Arch Linux. Use at your own risk."
arch=('x86_64')
url="http://cernbox.web.cern.ch/"
license=('GPL')

_repo='https://cernbox.cern.ch/cernbox/doc/Linux/repo/Fedora_39/'
source=(
    ${_repo}cernbox-client-overlays-icons-${pkgver/_/-}.x86_64.rpm
)
md5sums=('4f6c0e2c85b7ec089cd856ee1e9d31c6')

package() {
    mkdir -p "${pkgdir}/usr"
    cp -dpr "${srcdir}/usr/share" "${pkgdir}/usr/"
}
