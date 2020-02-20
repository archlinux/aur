# Maintainer: lod <aur@cyber-anlage.de>

_pkgname=html5_notifier
pkgname="roundcubemail-${_pkgname}"
pkgver=0.6.4
pkgrel=1
pkgdesc='Displays Desktop Notifications like the ones you might know from Google Mail'
arch=('any')
url='https://github.com/stremlau/html5_notifier'
license=('ISC')
depends=('roundcubemail')
source=("https://github.com/stremlau/html5_notifier/archive/v${pkgver}.tar.gz")
sha256sums=('52c335329a7e11c3f67c8224dcb8a3526ff97481ad47a64e846af1fe9c9bddf0')

package() {
    mkdir -p "${pkgdir}/usr/share/webapps/roundcubemail/plugins"
    cp -r "${srcdir}/${_pkgname}-${pkgver}" "${pkgdir}/usr/share/webapps/roundcubemail/plugins/${_pkgname}"
}
